package com.example.praticando.pessoa;


import com.example.praticando.profissao.ProfissaoModel;
import jakarta.persistence.*;

@Entity
@Table(name = "TBL_PESSOA")
public class PessoaModel {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String nome;
    private Integer idade;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "profissao_id")
    private ProfissaoModel profissao;

    public PessoaModel(){}

    public PessoaModel(Long id, String nome, Integer idade, ProfissaoModel profissao) {
        this.id = id;
        this.nome = nome;
        this.idade = idade;
        this.profissao = profissao;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public Integer getIdade() {
        return idade;
    }

    public void setIdade(Integer idade) {
        this.idade = idade;
    }

    public ProfissaoModel getProfissao() {
        return profissao;
    }

    public void setProfissao(ProfissaoModel profissao) {
        this.profissao = profissao;
    }
}
