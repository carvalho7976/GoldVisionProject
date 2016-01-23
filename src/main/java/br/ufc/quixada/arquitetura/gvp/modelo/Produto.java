package br.ufc.quixada.arquitetura.gvp.modelo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

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
	private String quantidade;
	
	@Column(name = "tipo_armacao")
	private String tipoArmacao;
	
	@ManyToOne
	@JoinColumn (name = "cod_marca")
	private Marca marca;
	
	public String getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(String quantidade) {
		this.quantidade = quantidade;
	}

	public String getTipoArmacao() {
		return tipoArmacao;
	}

	public void setTipoArmacao(String tipoArmacao) {
		this.tipoArmacao = tipoArmacao;
	}

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
	
	@Override
	public String toString() {
		return "Produto:[id"+getId()+"+]";
	}

	
}
