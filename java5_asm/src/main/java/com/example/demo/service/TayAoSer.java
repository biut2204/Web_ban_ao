package com.example.demo.service;

import com.example.demo.entity.TayAo;
import org.springframework.data.domain.Page;

import java.util.List;
import java.util.UUID;

public interface TayAoSer {

    List<TayAo> getAll();

    void add(TayAo tayAo);

    void update(UUID id, TayAo updateTayAo);

    void delete(UUID id);

    TayAo findId(UUID id);

    Page<TayAo> phanTrang(Integer pageNo, Integer size);
}
