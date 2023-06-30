package com.example.demo.repo;

import com.example.demo.entity.HoaDon;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface HoaDonRepo extends JpaRepository<HoaDon, UUID> {

    @Query("select hd from HoaDon hd where hd.ma = ?1")
    List<HoaDon> findByMa(String ma);

    @Query("select sum(hd.tongTien) from HoaDon hd where hd.ma = ?1")
    int tongTien(String ma);

    @Query("SELECT DISTINCT hd.ma FROM HoaDon hd where hd.khachHang.id = ?1")
    List<String> findByIdKh(UUID id);

    @Query("SELECT DISTINCT hd.ma FROM HoaDon hd")
    List<String> findAllHoaDon();

    @Query("SELECT DISTINCT hd.trangThai FROM HoaDon hd where hd.ma = ?1")
    String findTrangThai(String ma);
}
