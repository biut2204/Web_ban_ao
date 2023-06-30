package com.example.demo.service.impl;

import com.example.demo.entity.SanPham;
import com.example.demo.repo.SanPhamRepo;
import com.example.demo.service.SanPhamSer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
public class SanPhamSerImpl implements SanPhamSer {

    @Autowired
    SanPhamRepo sanPhamRepo;

    @Override
    public List<SanPham> getAll() {
        return sanPhamRepo.findAll();
    }

    @Override
    public Page<SanPham> view(Integer pgaeNo, Integer size) {
        Pageable pageable = PageRequest.of(pgaeNo,size);
        return sanPhamRepo.findAll(pageable);
    }

    @Override
    public void add(SanPham sanPham) {
        sanPhamRepo.save(sanPham);
    }

    @Override
    public void update(UUID id, SanPham updateSanPham) {
        Optional<SanPham> optionalSanPham = sanPhamRepo.findById(id);
        if(optionalSanPham.isPresent()){
            SanPham sanPham = optionalSanPham.get();
            sanPham.setMa(updateSanPham.getMa());
            sanPham.setTen(updateSanPham.getTen());
            sanPham.setAnh(updateSanPham.getAnh());
            sanPham.setLoaiAo(updateSanPham.getLoaiAo());
            sanPham.setCoAo(updateSanPham.getCoAo());
            sanPham.setTayAo(updateSanPham.getTayAo());
            sanPham.setGia(updateSanPham.getGia());
            sanPham.setTrangThai(updateSanPham.getTrangThai());
            sanPhamRepo.save(sanPham);
        }
    }

    @Override
    public void delete(UUID id) {
        sanPhamRepo.deleteById(id);
    }

    @Override
    public SanPham findId(UUID id) {
        Optional<SanPham> optionalSanPham = sanPhamRepo.findById(id);
        return optionalSanPham.orElse(null);
    }

    @Override
    public Page<SanPham> search(Integer minPrice, Integer maxPrice, Integer pageNo, Integer size) {
        Pageable pageable = PageRequest.of(pageNo, size);

        List<SanPham> list = sanPhamRepo.findAll();

        if (minPrice == null && maxPrice == null) {
            return sanPhamRepo.findAll(pageable);
        } else if (minPrice != null && maxPrice == null) {
            list = list.stream()
                    .filter(sp -> sp.getGia() >= minPrice)
                    .collect(Collectors.toList());
        } else if (minPrice == null && maxPrice != null) {
            list = list.stream()
                    .filter(sp -> sp.getGia() <= maxPrice)
                    .collect(Collectors.toList());
        } else if (minPrice != null && maxPrice != null) {
            list = list.stream()
                    .filter(sp -> sp.getGia() >= minPrice && sp.getGia() <= maxPrice)
                    .collect(Collectors.toList());
        }

        int start = Math.min((int) pageable.getOffset(), list.size());
        int end = Math.min((start + pageable.getPageSize()), list.size());

        return new PageImpl<>(list.subList(start, end), pageable, list.size());
    }
}
