package com.example.demo.service.impl;

import com.example.demo.entity.KhachHang;
import com.example.demo.repo.KhachHangRepo;
import com.example.demo.service.KhachHangSer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
public class KhachHangSerImpl implements KhachHangSer {

    @Autowired
    KhachHangRepo khachHangRepo;

    @Override
    public List<KhachHang> getAll() {
        return khachHangRepo.findAll();
    }

    @Override
    public void add(KhachHang khachHang) {
        khachHangRepo.save(khachHang);
    }

    @Override
    public void update(UUID id, KhachHang khachHang) {

    }

    @Override
    public KhachHang findId(UUID id) {
        Optional<KhachHang> optionalKhachHang = khachHangRepo.findById(id);
        return optionalKhachHang.orElse(null);
    }

    @Override
    public KhachHang findAccount(String email, String pass) {
        return khachHangRepo.findByEmailAndAndPass(email, pass);
    }

    @Override
    public Page<KhachHang> viewKhachHang(Integer pageNo, Integer size) {
        Pageable pageable = PageRequest.of(pageNo, size);
        return khachHangRepo.findAll(pageable);
    }
}
