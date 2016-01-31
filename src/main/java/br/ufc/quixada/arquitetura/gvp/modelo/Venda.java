package br.ufc.quixada.arquitetura.gvp.modelo;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(uniqueConstraints = @UniqueConstraint(columnNames = { "id" }))
public class Venda {

	public Venda() {
		super();
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Column(nullable = false)
	private Date dataVenda;
	private float valorVenda;
	private String formaPagamento;
	private Integer diaVencimento;
	private Integer numParcelas;
	private Integer numParcelasPagas;
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	private Date ultimoPagamento;
	
	public Date getDataVenda() {
		return dataVenda;
	}

	public void setDataVenda(Date dataVenda) {
		this.dataVenda = dataVenda;
	}

	public float getValorVenda() {
		return valorVenda;
	}

	public void setValorVenda(float valorVenda) {
		this.valorVenda = valorVenda;
	}

	public String getFormaPagamento() {
		return formaPagamento;
	}

	public void setFormaPagamento(String formaPagamento) {
		this.formaPagamento = formaPagamento;
	}

	public Integer getDiaVencimento() {
		return diaVencimento;
	}

	public void setDiaVencimento(Integer diaVencimento) {
		this.diaVencimento = diaVencimento;
	}

	public Integer getNumParcelas() {
		return numParcelas;
	}

	public void setNumParcelas(Integer numParcelas) {
		this.numParcelas = numParcelas;
	}

	public Integer getNumParcelasPagas() {
		return numParcelasPagas;
	}

	public void setNumParcelasPagas(Integer numParcelasPagas) {
		this.numParcelasPagas = numParcelasPagas;
	}

	public Date getUltimoPagamento() {
		return ultimoPagamento;
	}

	public void setUltimoPagamento(Date ultimoPagamento) {
		this.ultimoPagamento = ultimoPagamento;
	}
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	
	@Override
	public String toString() {
		return "Venda [id=" + id + ", dataVenda=" + dataVenda + ", valorVenda="
				+ valorVenda + ", formaPagamento=" + formaPagamento
				+ ", diaVencimento=" + diaVencimento + ", numParcelas="
				+ numParcelas + ", numParcelasPagas=" + numParcelasPagas
				+ ", ultimoPagamento=" + ultimoPagamento + "]";
	}

}

