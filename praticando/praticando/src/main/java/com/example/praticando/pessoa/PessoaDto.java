package com.example.praticando.pessoa;

public class PessoaDto {

    private Long id;
    private String nome;
    private Integer idade;
    private String nomeProfissao;

    public PessoaDto(){}

    public PessoaDto(Long id, String nome, Integer idade, String nomeProfissao) {
        this.id = id;
        this.nome = nome;
        this.idade = idade;
        this.nomeProfissao = nomeProfissao;
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

    public String getNomeProfissao() {
        return nomeProfissao;
    }

    public void setNomeProfissao(String nomeProfissao) {
        this.nomeProfissao = nomeProfissao;
    }
}
