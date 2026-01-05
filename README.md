# Identificando o Registro Mais Atual por Entidade usando SQL

## 📌 Contexto
Recebi uma demanda de um time comercial que precisava de um relatório, onde cada entidade fosse representada por apenas um registro válido e mais atual, evitando duplicidades que impactavam a análise e a tomada de decisão.

Toda a solução apresentada neste projeto é uma versão **genérica e anonimizada**, baseada em um cenário real de negócio.

---

## 🎯 Objetivo
Garantir que apenas o **registro mais atual por entidade** seja considerado no resultado final, respeitando regras de negócio e segmentações operacionais.

---

## 🧩 Desafio
- Existência de múltiplos registros associados à mesma entidade  
- Dificuldade em definir a granularidade correta do relatório  
- Necessidade de aplicar filtros de negócio sem reintroduzir duplicidades  

---

## 🛠️ Solução
A solução foi construída utilizando SQL, com foco em clareza e confiabilidade:

- Uso de **CTE (Common Table Expression)** para organizar a lógica
- Aplicação de **Window Function (`ROW_NUMBER`)** para identificar o registro mais recente
- Definição explícita da granularidade: **1 registro por entidade**
- Aplicação dos filtros de negócio somente após a seleção do registro válido

---

## 🧠 Estratégia
1. Os registros são ranqueados por entidade
2. O registro mais recente é priorizado
3. Apenas o registro válido é mantido
4. O resultado é enriquecido conforme a necessidade do relatório

---

## 📄 Query
A query disponível neste repositório representa uma versão genérica da solução, com nomes de tabelas e colunas abstraídos para preservar confidencialidade.

---

## ✅ Conclusão
Este projeto demonstra a importância de compreender:
- Modelagem de dados
- Granularidade correta em relatórios
- Uso consciente de Window Functions
- Tradução de demandas de negócio em soluções técnicas

A abordagem apresentada pode ser aplicada a diversos cenários que envolvem registros versionados ou múltiplos registros por entidade.
