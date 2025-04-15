package com.example.praticando.profissao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class ProfissaoService {

    @Autowired
    private ProfissaoRepository profissaoRepository;

    public List<ProfissaoDto> listarTodos(){
        return profissaoRepository.findAll()
                .stream()
                .map(this::converterParaDto)
                .collect(Collectors.toList());
    }

    public Optional<ProfissaoDto> listarById(Long id){
        return profissaoRepository.findById(id)
                .map(this::converterParaDto);
    }

    public ProfissaoDto criarProfissao(ProfissaoDto profissaoDto){
        ProfissaoModel profissaoModel = conveterParaModel(profissaoDto);
        return converterParaDto(profissaoRepository.save(profissaoModel));
    }

    public void editarProfissao(Long id, ProfissaoDto profissaoDto){
        profissaoDto.setId(id);
        ProfissaoModel profissaoModel = conveterParaModel(profissaoDto);
        profissaoRepository.save(profissaoModel);
    }

    public void deletarProfissao(Long id){
        profissaoRepository.deleteById(id);
    }

    private ProfissaoDto converterParaDto(ProfissaoModel profissaoModel) {
        return new ProfissaoDto(profissaoModel.getId(), profissaoModel.getNome());
    }

    private ProfissaoModel conveterParaModel(ProfissaoDto profissaoDto){
        ProfissaoModel profissaoModel = new ProfissaoModel();
        profissaoModel.setId(profissaoDto.getId());
        profissaoModel.setNome(profissaoDto.getNome());
        return profissaoModel;
    }
}
