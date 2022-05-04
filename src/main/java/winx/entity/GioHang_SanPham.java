package winx.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import winx.CompositePK.GHSPPK;

@Entity
@Table(name = "GIOHANG_SANPHAM")
@IdClass(GHSPPK.class)
public class GioHang_SanPham implements Serializable {
	@Id
	@ManyToOne
	@JoinColumn(name = "MaKH")
	private KhachHang khachHang;
	@Id
	@ManyToOne
	@JoinColumn(name = "MaSP")
	private SanPham sanPham;
	@Column(name = "SoLuong")
	private int soLuong;

	public KhachHang getKhachHang() {
		return khachHang;
	}

	public void setKhachHang(KhachHang khachHang) {
		this.khachHang = khachHang;
	}

	public SanPham getSanPham() {
		return sanPham;
	}

	public void setSanPham(SanPham sanPham) {
		this.sanPham = sanPham;
	}

	public int getSoLuong() {
		return soLuong;
	}

	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}

}
