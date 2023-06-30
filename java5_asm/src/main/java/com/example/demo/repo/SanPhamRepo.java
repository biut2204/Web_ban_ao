package com.example.demo.repo;

import com.example.demo.entity.SanPham;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface SanPhamRepo extends JpaRepository<SanPham, UUID> {
}
