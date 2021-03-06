package br.ufc.quixada.arquitetura.gvp.modelo;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonBackReference;
import org.codehaus.jackson.annotate.JsonIgnore;

@Entity
@Table(name="produto")
public class Produto {
	@Id
	@Column(name="id_produto")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@Column(name = "cod_produto")
	private String codigo;
	
	@Column(name = "qtd")
	private Integer quantidade;
	
	@Column(name = "tipo_armacao")
	private String tipoArmacao;
	
	@ManyToOne
	@JoinColumn (name = "cod_marca")
	@JsonBackReference
	private Marca marca;
	
	@ManyToOne
	@JoinColumn(name = "cod_modelo")
	@JsonBackReference
	private Modelo modelo;
	
	//seja feliz
//	@ManyToOne
//	private Venda venda;
	//@JoinColumn(name = "cod_venda")
	
	@OneToMany(mappedBy = "produto", targetEntity = Venda.class, fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private List<Venda> vendas;
	
	@Column(name = "valor_compra")
	private Double valorCompra;
	
	@Column(name = "valor_venda")
	private Double valorVenda;
	
	public Produto() {
	}
		
	public List<Venda> getVendas() {
		return vendas;
	}


	public void setVendas(List<Venda> vendas) {
		this.vendas = vendas;
	}


	public Integer getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(Integer quantidade) {
		this.quantidade = quantidade;
	}

	public String getTipoArmacao() {
		return tipoArmacao;
	}

	public void setTipoArmacao(String tipoArmacao) {
		this.tipoArmacao = tipoArmacao;
	}
	
	@JsonIgnore
	public Marca getMarca() {
		return marca;
	}

	public void setMarca(Marca marca) {
		this.marca = marca;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}
	@JsonIgnore
	public Modelo getModelo() {
		return modelo;
	}

	public void setModelo(Modelo modelo) {
		this.modelo = modelo;
	}

	public String getCodigo() {
		return codigo;
	}

	public Double getValorCompra() {
		return valorCompra;
	}

	public void setValorCompra(Double valorCompra) {
		this.valorCompra = valorCompra;
	}

	public Double getValorVenda() {
		return valorVenda;
	}

	public void setValorVenda(Double valorVenda) {
		this.valorVenda = valorVenda;
	}


	@Override
	public String toString() {
		return "Produto:[id"+getId()+"+]";
	}

	
}
