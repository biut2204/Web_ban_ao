package com.example.demo.service;

import com.example.demo.entity.KhachHang;
import org.springframework.data.domain.Page;

import java.util.List;
import java.util.UUID;

public interface KhachHangSer {

    List<KhachHang> getAll();

    void add(KhachHang khachHang);

    void update(UUID id, KhachHang khachHang);

    KhachHang findId(UUID id);

    KhachHang findAccount(String email, String pass);

    Page<KhachHang> viewKhachHang(Integer pageNo, Integer size);
}
