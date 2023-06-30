package com.example.demo.service;

import com.example.demo.entity.GioHang;
import org.springframework.data.domain.Page;

import java.util.List;
import java.util.UUID;

public interface GioHangSer {

    List<GioHang> getAll();

    void add(GioHang gioHang);

    void update(UUID id, GioHang updateGioHang);

    void delete(UUID id);

    Page<GioHang> viewGioHang(UUID idKhachHang,Integer pageNo, Integer size);

    GioHang fingId(UUID id);

    Long soLuongGioHang();
}
