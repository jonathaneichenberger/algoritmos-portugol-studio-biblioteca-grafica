## Merge Sort vs. Bubble Sort

### O que é um algoritmo de ordenação?

Um algoritmo de ordenação é um conjunto de instruções que reorganiza uma lista de elementos em uma ordem específica, como crescente ou decrescente.

### Merge Sort

* **Princípio:** Divide a lista a ser ordenada em sublistas menores, ordena essas sublistas recursivamente e, em seguida, combina as sublistas ordenadas em uma única lista ordenada.
* **Complexidade:** O(n log n) no melhor, médio e pior caso, o que o torna muito eficiente para grandes conjuntos de dados.
* **Vantagens:**
  * Eficiente para grandes conjuntos de dados.
  * Estável: mantém a ordem relativa de elementos iguais.
* **Desvantagens:**
  * Requer espaço extra para armazenar as sublistas durante a fusão.

### Bubble Sort

* **Princípio:** Compara elementos adjacentes e os troca de lugar se estiverem na ordem errada. Repete esse processo até que a lista esteja ordenada.
* **Complexidade:** O(n²) no pior e médio caso, o que o torna ineficiente para grandes conjuntos de dados.
* **Vantagens:**
  * Fácil de implementar.
* **Desvantagens:**
  * Lento para grandes conjuntos de dados.
  * Ineficiente em comparação com outros algoritmos.

### Comparação

| Característica | Merge Sort | Bubble Sort |
|---|---|---|
| Eficiência | Muito eficiente | Ineficiente para grandes conjuntos |
| Complexidade | O(n log n) | O(n²) |
| Estabilidade | Estável | Estável |
| Espaço extra | Requer | Não requer |
| Implementação | Mais complexa | Mais simples |

### Visualização

![mergesort-bubllesort](https://github.com/user-attachments/assets/729336f5-ca29-4e64-8aaf-64008ab8bb2c)









