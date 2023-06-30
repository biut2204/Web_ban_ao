package com.example.demo.service.impl;

import com.example.demo.entity.LoaiAo;
import com.example.demo.repo.LoaiAoRepo;
import com.example.demo.service.LoaiAoSer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
public class LoaiAoSerImpl implements LoaiAoSer {

    @Autowired
    LoaiAoRepo loaiAoRepo;

    @Override
    public List<LoaiAo> getAll() {
        return loaiAoRepo.findAll();
    }

    @Override
    public void add(LoaiAo loaiAo) {
        loaiAoRepo.save(loaiAo);
    }

    @Override
    public void update(UUID id, LoaiAo updateLoaiAo) {
        Optional<LoaiAo> optionalLoaiAo = loaiAoRepo.findById(id);
        if(optionalLoaiAo.isPresent()){
            LoaiAo loaiAo = optionalLoaiAo.get();
            loaiAo.setMa(updateLoaiAo.getMa());
            loaiAo.setTen(updateLoaiAo.getTen());
            loaiAoRepo.save(loaiAo);
        }
    }

    @Override
    public void delete(UUID id) {
        loaiAoRepo.deleteById(id);
    }

    @Override
    public LoaiAo findId(UUID id) {
        Optional<LoaiAo> optionalLoaiAo = loaiAoRepo.findById(id);
        return optionalLoaiAo.orElse(null);
    }

    @Override
    public Page<LoaiAo> phanTrang(Integer pageNo, Integer size) {
        Pageable pageable = PageRequest.of(pageNo,size);
        return loaiAoRepo.findAll(pageable);
    }
}
