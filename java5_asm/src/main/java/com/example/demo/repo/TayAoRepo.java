package com.example.demo.repo;

import com.example.demo.entity.TayAo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface TayAoRepo extends JpaRepository<TayAo, UUID> {
}
