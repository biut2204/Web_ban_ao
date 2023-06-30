package com.example.demo.repo;

import com.example.demo.entity.GioHang;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface GioHangRepo extends JpaRepository<GioHang, UUID> {

    @Query("select count(gh.id) from GioHang gh")
    long countAll();

    @Query("select gh from GioHang gh where gh.khachHang.id = ?1")
    Page<GioHang> findByKhachHang(UUID id, Pageable pageable);

}
