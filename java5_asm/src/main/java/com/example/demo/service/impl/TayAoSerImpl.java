package com.example.demo.service.impl;

import com.example.demo.entity.TayAo;
import com.example.demo.repo.TayAoRepo;
import com.example.demo.service.TayAoSer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
public class TayAoSerImpl implements TayAoSer {

    @Autowired
    TayAoRepo tayAoRepo;

    @Override
    public List<TayAo> getAll() {
        return tayAoRepo.findAll();
    }

    @Override
    public void add(TayAo tayAo) {
        tayAoRepo.save(tayAo);
    }

    @Override
    public void update(UUID id, TayAo updateTayAo) {
        Optional<TayAo> optionalTayAo = tayAoRepo.findById(id);
        if (optionalTayAo.isPresent()) {
            TayAo tayAo = optionalTayAo.get();
            tayAo.setMa(updateTayAo.getMa());
            tayAo.setTen(updateTayAo.getTen());
            tayAoRepo.save(tayAo);
        }
    }

    @Override
    public void delete(UUID id) {
        tayAoRepo.deleteById(id);
    }

    @Override
    public TayAo findId(UUID id) {
        Optional<TayAo> optionalTayAo = tayAoRepo.findById(id);
        return optionalTayAo.orElse(null);
    }

    @Override
    public Page<TayAo> phanTrang(Integer pageNo, Integer size) {
        Pageable pageable = PageRequest.of(pageNo,size);
        return tayAoRepo.findAll(pageable);
    }
}
