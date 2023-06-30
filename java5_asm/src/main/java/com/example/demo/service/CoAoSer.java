package com.example.demo.service;

import com.example.demo.entity.CoAo;
import org.springframework.data.domain.Page;

import java.util.List;
import java.util.UUID;

public interface CoAoSer {

    List<CoAo> getAll();

    void add(CoAo coAo);

    void update(UUID id, CoAo updateCoAo);

    void delete(UUID id);

    CoAo findId(UUID id);

    Page<CoAo> phanTrang(Integer pageNo, Integer size);
}
