package com.example.demo.service;

import com.example.demo.entity.SanPham;
import org.springframework.data.domain.Page;

import java.util.List;
import java.util.UUID;

public interface SanPhamSer {
    List<SanPham> getAll();

    Page<SanPham> view(Integer pgaeNo, Integer size);

    void add(SanPham sanPham);

    void update(UUID id , SanPham updateSanPham);

    void delete(UUID id);

    SanPham findId(UUID id);

    Page<SanPham> search(Integer min, Integer max, Integer pageNo, Integer size);

}
