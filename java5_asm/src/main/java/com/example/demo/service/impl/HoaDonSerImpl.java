package com.example.demo.service.impl;

import com.example.demo.entity.HoaDon;
import com.example.demo.repo.HoaDonRepo;
import com.example.demo.service.HoaDonSer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
public class HoaDonSerImpl implements HoaDonSer {

    @Autowired
    HoaDonRepo hoaDonRepo;

    @Override
    public List<HoaDon> getAll() {
        return hoaDonRepo.findAll();
    }

    @Override
    public void add(HoaDon hoaDon) {
        hoaDonRepo.save(hoaDon);
    }

    @Override
    public void update(UUID id, HoaDon updateHoaDon) {
        Optional<HoaDon> optionalHoaDon = hoaDonRepo.findById(id);
        if(optionalHoaDon.isPresent()){
            HoaDon hoaDon = optionalHoaDon.get();
            hoaDon.setGioHang(updateHoaDon.getGioHang());
            hoaDon.setNguoiBan(updateHoaDon.getNguoiBan());
            hoaDon.setKhachHang(updateHoaDon.getKhachHang());
            hoaDon.setDiaChi(updateHoaDon.getDiaChi());
            hoaDon.setSdt(updateHoaDon.getSdt());
            hoaDon.setTongTien(updateHoaDon.getTongTien());
            hoaDon.setTrangThai(updateHoaDon.getTrangThai());
            hoaDonRepo.save(hoaDon);
        }
    }

    @Override
    public HoaDon findId(UUID id) {
        Optional<HoaDon> optionalHoaDon = hoaDonRepo.findById(id);
        return optionalHoaDon.orElse(null);
    }

    @Override
    public int tongTien(String ma) {
        return hoaDonRepo.tongTien(ma);
    }

    @Override
    public List<HoaDon> getByMa(String ma) {
        return hoaDonRepo.findByMa(ma);
    }

    @Override
    public List<String> findByIdKh(UUID id) {
        return hoaDonRepo.findByIdKh(id);
    }

    @Override
    public String findTrangThai(String ma) {
        return hoaDonRepo.findTrangThai(ma);
    }

    @Override
    public List<String> findAllHoaDon() {
        return hoaDonRepo.findAllHoaDon();
    }
}
