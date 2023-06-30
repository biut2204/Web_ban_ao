package com.example.demo.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.util.UUID;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@Entity
@Table(name = "Hoa_Don")
public class HoaDon {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "Id")
    UUID id;

    @Column(name = "Ma")
    String ma;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "IdGH",referencedColumnName = "Id")
    GioHang gioHang;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "IdKH",referencedColumnName = "Id")
    KhachHang khachHang;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "IdNB",referencedColumnName = "Id")
    NguoiBan nguoiBan;

    @Column(name = "DiaChi")
    String diaChi;

    @Column(name = "Sdt")
    String sdt;

    @Column(name = "TongTien")
    int tongTien;

    @Column(name = "TrangThai")
    String trangThai;
}
