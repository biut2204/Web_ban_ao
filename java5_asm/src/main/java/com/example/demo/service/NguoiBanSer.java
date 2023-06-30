package com.example.demo.service;

import com.example.demo.entity.NguoiBan;

import java.util.UUID;

public interface NguoiBanSer {
    NguoiBan findAcount(String email, String pass);

    NguoiBan findId(UUID id);
}
