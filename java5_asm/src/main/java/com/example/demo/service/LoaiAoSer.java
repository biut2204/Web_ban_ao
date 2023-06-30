package com.example.demo.service;

import com.example.demo.entity.LoaiAo;
import org.springframework.data.domain.Page;

import java.util.List;
import java.util.UUID;

public interface LoaiAoSer {

    List<LoaiAo> getAll();

    void add(LoaiAo loaiAo);

    void update(UUID id, LoaiAo updateLoaiAo);

    void delete(UUID id);

    LoaiAo findId(UUID id);

    Page<LoaiAo> phanTrang(Integer pageNo, Integer size);
}
