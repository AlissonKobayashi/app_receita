package com.example.praticando.profissao;

public class ProfissaoDto {

    private Long id;
    private String nome;

    public ProfissaoDto(){}

    public ProfissaoDto(Long id, String nome) {
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
