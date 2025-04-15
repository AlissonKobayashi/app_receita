package com.example.praticando.pessoa;

import com.example.praticando.profissao.ProfissaoModel;
import com.example.praticando.profissao.ProfissaoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class PessoaService {

    @Autowired
    private PessoaRepository pessoaRepository;

    @Autowired
    private ProfissaoRepository profissaoRepository;

    public List<PessoaDto> listarTodos() {
        return pessoaRepository.findAll()
                .stream()
                .map(this::converterParaDto)
                .collect(Collectors.toList());
    }

    public Optional<PessoaDto> listarById(Long id) {
        return pessoaRepository.findById(id).map(this::converterParaDto);
    }

    public PessoaDto criarPessoa(PessoaDto pessoaDto) {
        PessoaModel pessoaModel = converterParaModel(pessoaDto);
        return converterParaDto(pessoaRepository.save(pessoaModel));
    }

    public void editarPessoa(Long id, PessoaDto pessoaDto) {
        pessoaDto.setId(id);
        PessoaModel pessoaModel = converterParaModel(pessoaDto);
        pessoaRepository.save(pessoaModel);
    }

    public void deletarPessoa(Long id) {
        pessoaRepository.deleteById(id);
    }

    private PessoaDto converterParaDto(PessoaModel pessoaModel) {
        String nomeProfissao = pessoaModel.getProfissao() != null ? pessoaModel.getProfissao().getNome() : null;
        return new PessoaDto(pessoaModel.getId(), pessoaModel.getNome(), pessoaModel.getIdade(), nomeProfissao);
    }

    private PessoaModel converterParaModel(PessoaDto pessoaDto) {
        PessoaModel pessoaModel = new PessoaModel();
        pessoaModel.setId(pessoaDto.getId());
        pessoaModel.setNome(pessoaDto.getNome());
        pessoaModel.setIdade(pessoaDto.getIdade());

        if (pessoaDto.getNomeProfissao() != null) {
            ProfissaoModel profissao = profissaoRepository.findByNome(pessoaDto.getNomeProfissao())
                    .orElseThrow(() -> new RuntimeException("Profissão não encontrada" ));
            pessoaModel.setProfissao(profissao);
        }

        return pessoaModel;
    }
}