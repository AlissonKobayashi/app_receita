package com.example.praticando.profissao;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface ProfissaoRepository extends JpaRepository<ProfissaoModel, Long> {
    Optional<ProfissaoModel> findByNome(String nomeProfissao);
}
