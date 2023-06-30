package com.example.demo.service;

import com.example.demo.entity.HoaDon;
import org.springframework.data.domain.Page;

import java.util.List;
import java.util.UUID;

public interface HoaDonSer {

    List<HoaDon> getAll();

    void add(HoaDon hoaDon);

    void update(UUID id, HoaDon updateHoaDon);

    HoaDon findId(UUID id);

    int tongTien(String ma);

    List<HoaDon> getByMa(String ma);

    List<String> findByIdKh(UUID id);

    String findTrangThai(String ma);

    List<String> findAllHoaDon();
}
