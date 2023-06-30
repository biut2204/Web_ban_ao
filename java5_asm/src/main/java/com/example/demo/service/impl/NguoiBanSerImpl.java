package com.example.demo.service.impl;

import com.example.demo.entity.NguoiBan;
import com.example.demo.repo.NguoiBanRepo;
import com.example.demo.service.NguoiBanSer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;
import java.util.UUID;

@Service
public class NguoiBanSerImpl implements NguoiBanSer {

    @Autowired
    NguoiBanRepo nguoiBanRepo;

    @Override
    public NguoiBan findAcount(String email, String pass) {
        return nguoiBanRepo.findByEmailAndAndPass(email, pass);
    }

    @Override
    public NguoiBan findId(UUID id) {
        Optional<NguoiBan> optionalNguoiBan = nguoiBanRepo.findById(id);
        return optionalNguoiBan.orElse(null);
    }
}
