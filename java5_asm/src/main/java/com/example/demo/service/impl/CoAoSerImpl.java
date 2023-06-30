package com.example.demo.service.impl;

import com.example.demo.entity.CoAo;
import com.example.demo.repo.CoAoRepo;
import com.example.demo.service.CoAoSer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
public class CoAoSerImpl implements CoAoSer {

    @Autowired
    CoAoRepo coAoRepo;

    @Override
    public List<CoAo> getAll() {
        return coAoRepo.findAll();
    }

    @Override
    public void add(CoAo coAo) {
        coAoRepo.save(coAo);
    }

    @Override
    public void update(UUID id, CoAo updateCoAo) {
        Optional<CoAo> optionalCoAo = coAoRepo.findById(id);
        if (optionalCoAo.isPresent()) {
            CoAo coAo = optionalCoAo.get();
            coAo.setMa(updateCoAo.getMa());
            coAo.setTen(updateCoAo.getTen());
            coAoRepo.save(coAo);
        }
    }

    @Override
    public void delete(UUID id) {
        coAoRepo.deleteById(id);
    }

    @Override
    public CoAo findId(UUID id) {
        Optional<CoAo> optionalCoAo = coAoRepo.findById(id);
        return optionalCoAo.orElse(null);
    }

    @Override
    public Page<CoAo> phanTrang(Integer pageNo, Integer size) {
        Pageable pageable = PageRequest.of(pageNo,size);
        return coAoRepo.findAll(pageable);
    }
}
