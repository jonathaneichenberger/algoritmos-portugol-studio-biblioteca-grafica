programa
{

	inclua biblioteca Tipos --> tp
	inclua biblioteca Teclado --> t
	inclua biblioteca Graficos --> g
	inclua biblioteca Util --> u

	const inteiro tamanho = 100000
	
	inteiro numero[tamanho]
	inteiro opcao = 5
	inteiro largura_janela = 1200
	inteiro altura_janela = 800
	inteiro c = 0
	inteiro n = 0
	inteiro auxiliar = 0
	inteiro total = 0
	inteiro comeco_contagem = 0
	inteiro fim_contagem = 0
	real tempo_bubllesort[20]
	real tempo_mergesort[20]
	real tempo_preencher[20]
	real tempo_embaralhar[40]
	inteiro ponteiro_bubllesort = 0
	inteiro ponteiro_mergesort = 0
	real tamanho_vetor[20]
	inteiro incremento_posicao_vetor = 0
	inteiro total_final = 0
	inteiro rodar = 0
	
	funcao inicio()
	{

		escolha(opcao)
		{
			
			caso 1:
			{
				preencher()
				pare
			}

			caso 2:
			{
				se(ponteiro_bubllesort > ponteiro_mergesort)
				{
					opcao = 4
					embaralhar()
				}
				senao
				{
					opcao = 3
					embaralhar()
					
				}
				pare
			}
			caso 3:
			{
				bublle_sort()
				pare
			}
			caso 4:
			{
				total = tamanho_vetor[incremento_posicao_vetor - 1]
				
				comeco_contagem = u.tempo_decorrido()
				
				merge_sort(numero, 0, total - 1)

				fim_contagem = u.tempo_decorrido()
				
				tempo_mergesort[incremento_posicao_vetor - 1] = fim_contagem - comeco_contagem
				
				ponteiro_mergesort++
				rodar++
				opcao = 5
				pare
			}
			caso 5:
			{
				
				iniciar_modo_grafico()
				
				g.definir_fonte_texto("Arial")
         		 	g.definir_titulo_janela("SITUAÇÃO DE APREDIZAGEM 6 ETAPA 1 -- BUBLLE SORT --")

          		enquanto(nao t.tecla_pressionada(t.TECLA_ENTER))
          		{
          			
					se(incremento_posicao_vetor > 0)
					{
						
						se(tamanho_vetor[incremento_posicao_vetor - 1] < tamanho)
						{
							tamanho_vetor[incremento_posicao_vetor] = tamanho_vetor[incremento_posicao_vetor - 1] + 5000.0
							incremento_posicao_vetor++
							total_final = tamanho_vetor[incremento_posicao_vetor - 1]
							opcao = 1
							inicio()
						}
						senao se(tamanho_vetor[incremento_posicao_vetor - 1] == tamanho)
						{
							enquanto(nao t.tecla_pressionada(t.TECLA_ENTER))
							{
								montar_grafico(tamanho_vetor, ponteiro_bubllesort, ponteiro_mergesort, tempo_bubllesort, tempo_mergesort)
          						g.renderizar()
							}
						}
					}
					senao se(incremento_posicao_vetor == 0)
					{
						tamanho_vetor[incremento_posicao_vetor] = 5000.0
						incremento_posicao_vetor++
						total_final = tamanho_vetor[incremento_posicao_vetor - 1]
						opcao = 1
          				
						inicio()
						
					}
					
					montar_grafico(tamanho_vetor, ponteiro_bubllesort, ponteiro_mergesort, tempo_bubllesort, tempo_mergesort)
          			g.renderizar()
				
          		}
				pare	
			}
		}
	}
	
	funcao preencher()
	{	
		
		comeco_contagem = u.tempo_decorrido()
		
		para(n = 0 ; n < tamanho_vetor[incremento_posicao_vetor - 1]; n++)
		{
			numero[n] = n + 1
			
		}
		
		fim_contagem = u.tempo_decorrido()

		tempo_preencher[incremento_posicao_vetor - 1] = fim_contagem - comeco_contagem
		rodar++
		opcao = 2
		inicio()
	}

	funcao embaralhar()
	{

		comeco_contagem = u.tempo_decorrido()
		
		para(n = tamanho_vetor[incremento_posicao_vetor - 1] - 1; n >= 0; n--)
		{
			 c = u.sorteia(0, total_final - 1)
			auxiliar = numero[n]
  			numero[n] = numero[c]
  			numero[c] = auxiliar
		}
		
		fim_contagem = u.tempo_decorrido()

		tempo_embaralhar[incremento_posicao_vetor - 1] = fim_contagem - comeco_contagem
		rodar++
		inicio()
	}

	funcao bublle_sort()
	{ 	
		total = tamanho_vetor[incremento_posicao_vetor -1]

		comeco_contagem = u.tempo_decorrido()
		
		para(n = 0; n < tamanho_vetor[incremento_posicao_vetor -1]; n++)
		{
			para(c = 0; c <  total- 1; c++ )
			{
				se( numero[c] > numero[c + 1])
				{
					auxiliar = numero[c]
					numero[c] = numero[c + 1]
					numero[c + 1] = auxiliar
				}
			}
			
			total--
		}
		fim_contagem = u.tempo_decorrido()

		tempo_bubllesort[ponteiro_bubllesort] = fim_contagem - comeco_contagem
		
		ponteiro_bubllesort++
		rodar++
		opcao = 2
		inicio()
	}

	funcao merge_sort(inteiro vetor[], inteiro inic, inteiro fim)
	{
		inteiro meio, i, j, k, aux[tamanho]
		
	     se(inic < fim)
	     {
			meio = (inic + fim) / 2
			merge_sort(vetor, inic, meio)
			merge_sort(vetor, meio + 1, fim)
			
			
			i = inic
			j = meio + 1
			k = inic
			
			enquanto(i <= meio e j <= fim)
			{
				se(vetor[i] < vetor[j])
				{
					aux[k] = vetor[i]
					i++
				}
				senao
				{
					aux[k] = vetor[j]
					j++
				}
				k++
			}
			enquanto(i <= meio)
			{
				aux[k] = vetor[i]
				i++
				k++
			}
			enquanto(j <= fim)
			{
				aux[k] = vetor[j]
				j++
				k++
			}
			
			para(i = inic; i <= fim; i++)
			{
				vetor[i] = aux[i]
			}
	    	}
	}

	funcao montar_grafico(real tamanho_grafico[], inteiro ponteiro_grafico_bubllesort, inteiro ponteiro_grafico_mergesort, real contagem_bubllesort[], real contagem_mergesort[]) 
	{
		inteiro incremento_vertical = 60
		inteiro incremento_horizontal = 90
		real aux_bublle1[20], aux_bublle2[20], aux_merge1[20], aux_merge2[20]

		g.definir_cor(0xF5F5F5)
		g.desenhar_retangulo(0, 0, 1200, 800, falso, verdadeiro)

		g.definir_cor(g.COR_PRETO)
		g.desenhar_retangulo(150, 650, 920, 5, falso, verdadeiro)
		
		g.definir_cor(g.COR_PRETO)
		g.desenhar_retangulo(150, 30, 5, 620, falso, verdadeiro)

		g.definir_cor(g.COR_PRETO)
		g.desenhar_retangulo(173, 73, 34, 34, verdadeiro, verdadeiro)

		g.definir_cor(g.COR_AZUL)
		g.desenhar_retangulo(175, 77, 30, 30, verdadeiro, verdadeiro)

		g.definir_cor(g.COR_PRETO)
		g.desenhar_retangulo(173, 115, 34, 34, verdadeiro, verdadeiro)

		g.definir_cor(g.COR_VERMELHO)
		g.desenhar_retangulo(175, 117, 30, 30, verdadeiro, verdadeiro)

		g.definir_cor(g.COR_PRETO)
		g.definir_estilo_texto(falso, verdadeiro, falso)
		g.definir_fonte_texto("Time New Romans")
		g.definir_tamanho_texto(26.0)
		g.desenhar_texto(210, 82, "Bublle Sort")
		g.desenhar_texto(210, 122, "Merge Sort")

		para(inteiro r = 0; r < 11; r++)
		{
			g.definir_cor(g.COR_PRETO)
			g.desenhar_retangulo(125, 650 - r * incremento_vertical, 25, 5, falso, verdadeiro)

			g.definir_cor(g.COR_PRETO)
			g.desenhar_retangulo(150 + r * incremento_horizontal, 655, 5, 25, falso, verdadeiro)

			g.definir_cor(0xdfdfdf)
			g.desenhar_linha(155, 592 - r * incremento_vertical, 1070, 592 - r * incremento_vertical )
		}

		g.definir_cor(g.COR_PRETO)
		g.definir_estilo_texto(falso, falso, falso)
		g.definir_fonte_texto("Time New Romans")
		g.definir_tamanho_texto(30.0)
		g.desenhar_texto(70, 0, "Tempo(ms)")
		g.desenhar_texto(900, 610, "Tamanho(vetor)")

		g.definir_tamanho_texto(24.0)
		g.desenhar_texto(67, 40, "100s")
		g.desenhar_texto(78, 100, "90s")
		g.desenhar_texto(78, 160, "80s")
		g.desenhar_texto(78, 220, "70s")
		g.desenhar_texto(78, 280, "60s")
		g.desenhar_texto(78, 340, "50s")
		g.desenhar_texto(78, 400, "40s")
		g.desenhar_texto(78, 460, "30s")
		g.desenhar_texto(78, 520, "20s")
		g.desenhar_texto(78, 580, "10s")
		g.desenhar_texto(100, 635, "0")
		
		g.desenhar_texto(145, 685, "0")
		g.desenhar_texto(220, 685, "10k")
		g.desenhar_texto(310, 685, "20k")
		g.desenhar_texto(400, 685, "30k")
		g.desenhar_texto(490, 685, "40k")
		g.desenhar_texto(580, 685, "50k")
		g.desenhar_texto(670, 685, "60k")
		g.desenhar_texto(760, 685, "70k")
		g.desenhar_texto(850, 685, "80k")
		g.desenhar_texto(940, 685, "90k")
		g.desenhar_texto(1030, 685, "100k")
		

		para(inteiro y = 0; y <= ponteiro_grafico_bubllesort - 1; y++)
		{
			g.definir_cor(g.COR_AZUL)
			
			aux_bublle1[y] = 900 * (tamanho_grafico[y] / 100000)
			aux_bublle2[y] = 600 * (contagem_bubllesort[y] / 100000)
		
			g.desenhar_elipse(144 + aux_bublle1[y], 645 - aux_bublle2[y], 16, 16, verdadeiro)
			
			se(y == 0)
			{
				g.desenhar_linha(149, 650, 144 + aux_bublle1[y] + 8, 645 - aux_bublle2[y] + 8)
			}
			senao
			{
				g.desenhar_linha(149 + aux_bublle1[y-1], 650 - aux_bublle2[y-1] + 4, 144 + aux_bublle1[y] + 8, 645 - aux_bublle2[y] + 8)
			}	
		}
		para(inteiro d = 0; d <= ponteiro_grafico_mergesort - 1; d++)
		{
			
			g.definir_cor(g.COR_VERMELHO)
			aux_merge1[d] = 900 * (tamanho_grafico[d] / 100000)
			aux_merge2[d] = 600 * (contagem_mergesort[d] / 100000)
		
		
			g.desenhar_elipse(144 + aux_merge1[d], 645 - aux_merge2[d], 16, 16, verdadeiro)
			se(d == 0)
			{
				g.desenhar_linha(149, 650, 144 + aux_merge1[d] + 8, 645 - aux_merge2[d] + 8)
			}
			senao
			{
				g.desenhar_linha(149 + aux_merge1[d-1], 650 - aux_merge2[d-1] + 4, 144 + aux_merge1[d] + 8, 645 - aux_merge2[d] + 8)
			}
		}
	}

	funcao iniciar_modo_grafico()
	{
		g.iniciar_modo_grafico(verdadeiro)

		g.definir_cor(0x67C2E6)
		g.definir_dimensoes_janela(largura_janela, altura_janela)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 704; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {tempo_bubllesort, 21, 6, 16}-{tempo_mergesort, 22, 6, 15}-{tempo_embaralhar, 24, 6, 16}-{tamanho_vetor, 27, 6, 13};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */