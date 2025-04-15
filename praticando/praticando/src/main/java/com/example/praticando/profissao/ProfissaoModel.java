package com.example.praticando.profissao;

import jakarta.persistence.*;

@Entity
@Table(name = "TBL_PROFISSAO")
public class ProfissaoModel {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String nome;

    public ProfissaoModel(){}

    public ProfissaoModel(Long id, String nome) {
        this.id = id;
        this.nome = nome;
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
}
