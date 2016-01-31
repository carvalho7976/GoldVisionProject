package br.ufc.quixada.arquitetura.gvp.modelo;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;
import javax.validation.constraints.NotNull;

@Entity
@Table(uniqueConstraints = @UniqueConstraint(columnNames = { "id" }))
public class Venda {

	public Venda() {
		super();
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@OneToMany(mappedBy = "venda", targetEntity = Produto.class, fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private List<Produto> produtos;

	@ManyToOne
	private Cliente cliente;
	
	@Column(nullable = false)
	private Date dataVenda;
	private Double valorVenda;
	private String formaPagamento;
	private Integer diaVencimento;
	private Integer numParcelas;
	private Integer numParcelasPagas;
	private Integer ultimoPagamento;
	
	
	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

	public List<Produto> getProdutos() {
		return produtos;
	}

	public void setProdutos(List<Produto> produtos) {
		this.produtos = produtos;
	}

	public Date getDataVenda() {
		return dataVenda;
	}

	public void setDataVenda(Date dataVenda) {
		this.dataVenda = dataVenda;
	}

	public Double getValorVenda() {
		return valorVenda;
	}

	public void setValorVenda(Double valorVenda) {
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

	public Integer getUltimoPagamento() {
		return ultimoPagamento;
	}

	public void setUltimoPagamento(Integer ultimoPagamento) {
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
