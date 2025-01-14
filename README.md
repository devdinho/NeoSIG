# NeoSIG

**NeoSIG** é um projeto piloto voltado para o aprendizado e exploração do uso de imagens de satélite, especialmente aquelas fornecidas pelo programa PRODES, com o objetivo de entender, analisar e aplicar Sistemas de Informações Geográficas (SIG) em estudos de desmatamento e mudanças ambientais.

## Objetivo

O principal objetivo do NeoSIG é criar um ambiente prático para:
- Aprender a manipular e interpretar dados de imagens de satélite do PRODES.
- Desenvolver habilidades em ferramentas de SIG.
- Criar uma base de conhecimento para futuros projetos relacionados à análise de desmatamento.

## Motivação

O desmatamento é um dos grandes desafios ambientais do nosso tempo. Ferramentas como o PRODES fornecem dados valiosos para monitoramento e análise dessas mudanças. Este projeto foi concebido para capacitar seus participantes no uso dessas ferramentas, promovendo conhecimento técnico e aplicável na área.

## Funcionalidades Planejadas

- Importação e processamento de imagens de satélite do PRODES.
- Visualização de dados em mapas interativos.
- Análise básica de desmatamento e cobertura do solo.
- Geração de relatórios e métricas relevantes.

## Tecnologias Utilizadas

- **Linguagens:** Python.
- **Bibliotecas:**
  - `geopandas` para análise espacial.
  - `rasterio` para manipulação de dados raster.
  - `matplotlib` e `plotly` para visualização de dados.
  - `QGIS` ou outro software SIG para análises mais avançadas.
  - `fastapi` para o desenvolvimento da API.
- **Dados:** Imagens e dados do programa PRODES.

## Estrutura do Projeto

```
NeoSIG/
├── data/                 # Dados brutos e processados
├── notebooks/            # Jupyter Notebooks para aprendizado e testes
├── src/                  # Código-fonte principal
├── reports/              # Relatórios e análises gerados
├── README.md             # Este arquivo
└── requirements.txt      # Dependências do projeto
```

## Como Começar

1. **Clone o repositório:**
   ```bash
   git clone git@github.com:freitasanderson1/NeoSIG.git   
   ```

2. **Instale as dependências:**
   ```bash
   pip install -r requirements.txt
   ```

3. **Baixe os dados do PRODES:**
   - Acesse o site oficial do [PRODES](http://terrabrasilis.dpi.inpe.br/) e obtenha os dados desejados.

4. **Inicie sua análise:**
   - Utilize os notebooks disponíveis na pasta `notebooks` para iniciar o aprendizado e as análises.

## Contribuição

Este é um projeto aberto para aprendizado. Caso tenha sugestões ou melhorias, sinta-se à vontade para contribuir por meio de pull requests.

## Licença

[MIT License](LICENSE)

---

**Nota:** Este projeto é experimental e está sendo desenvolvido como um piloto para aprendizado. Recomenda-se que seja expandido com o tempo e com o progresso das análises e das capacidades dos participantes.
