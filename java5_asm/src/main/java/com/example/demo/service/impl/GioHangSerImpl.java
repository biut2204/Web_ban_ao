package com.example.demo.service.impl;

import com.example.demo.entity.GioHang;
import com.example.demo.repo.GioHangRepo;
import com.example.demo.service.GioHangSer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
public class GioHangSerImpl implements GioHangSer {

    @Autowired
    GioHangRepo gioHangRepo;

    @Override
    public List<GioHang> getAll() {
        return gioHangRepo.findAll();
    }

    @Override
    public void add(GioHang gioHang) {
        gioHangRepo.save(gioHang);
    }

    @Override
    public void update(UUID id, GioHang updateGioHang) {
        Optional<GioHang> optionalGioHang = gioHangRepo.findById(id);
        if(optionalGioHang.isPresent()){
            GioHang gioHang = optionalGioHang.get();
            gioHang.setSoLuong(updateGioHang.getSoLuong());
            gioHangRepo.save(gioHang);
        }
    }

    @Override
    public void delete(UUID id) {
        gioHangRepo.deleteById(id);
    }

    @Override
    public Page<GioHang> viewGioHang(UUID idKhachHang,Integer pageNo, Integer size) {
        Pageable pageable = PageRequest.of(pageNo,size);
        Page<GioHang> gioHangPage;
        if(idKhachHang == null){
            gioHangPage = gioHangRepo.findAll(pageable);
        }
        else{
            gioHangPage = gioHangRepo.findByKhachHang(idKhachHang,pageable);
        }
        return gioHangPage;
    }

    @Override
    public GioHang fingId(UUID id) {
        Optional<GioHang> optionalGioHang = gioHangRepo.findById(id);
        return optionalGioHang.orElse(null);
    }

    @Override
    public Long soLuongGioHang() {
        return gioHangRepo.countAll();
    }
}
