package com.example.demo.repo;

import com.example.demo.entity.KhachHang;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface KhachHangRepo extends JpaRepository<KhachHang, UUID> {
    KhachHang findByEmailAndAndPass(String email, String pass);
}
