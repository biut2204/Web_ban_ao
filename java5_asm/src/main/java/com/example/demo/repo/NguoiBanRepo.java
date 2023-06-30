package com.example.demo.repo;

import com.example.demo.entity.NguoiBan;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface NguoiBanRepo extends JpaRepository<NguoiBan, UUID> {
    NguoiBan findByEmailAndAndPass(String email, String pass);
}
