/*
Alunos: Jonathan Reinaldo Eichenberger e Felipe
Curso: Desenvolvimento de sistemas
Módulo: Lógica de Programação
Professor: Christian Daniel Licnerski Marques Pinheiro
Tipo de Entrega: Não Avaliativa
Atividade: Stiuação de Aprendizagem 6 - Etapa 1
*/


programa
{

	inclua biblioteca Tipos --> tp
	inclua biblioteca Teclado --> t
	inclua biblioteca Graficos --> g
	inclua biblioteca Util --> u

	//Constante e variaveis para o sistema sem modo grafico
	const inteiro tamanho = 100000
	inteiro numero[tamanho]
	inteiro opcao
	inteiro c = 0
	inteiro n = 0
	cadeia enter
	inteiro auxiliar = 0
	inteiro total = 0
	inteiro comeco_contagem = 0
	inteiro fim_contagem = 0
	inteiro i = 0

	//Constante e variaveis para o sistema no modo grafico
	inteiro palheta_de_cores[20] = {0xEAE600 ,0xCD0036,0x8F001D, 0xE50C00, 0xE58900,0xE66002, 0x008F00 ,0x4D000A,
							 0x00BE00, 0x004DF0, 0x004D00,0x006300 , 0x00CD00, 0x00F000, 0x00CD63,
							 0xF03F72,0xE65845, 0x1130E5, 0x008FC1, 0x0063CD}						 	 
	inteiro numeros[20] = {01, 07, 10, 09, 02, 03, 20, 18, 33, 90, 44, 34, 30, 21, 27, 05, 08, 99, 54, 68}
	inteiro largura_janela = 1200
	inteiro altura_janela = 800
	inteiro contador = 0
	inteiro ponteiro = 0
	inteiro largura_bloco = 52
	inteiro largura_cor_bloco = 48
	cadeia texto[20]
	inteiro posicao[22]
	inteiro auxiliar_troca = 0
	
	funcao inicio()
	{
		/*escreva("Bem vindo")
		u.aguarde(1000)
		limpa()*/
		
		escreva("MENU GERAL \n\n")
		
		escreva("1 - Preencher o vetor\n")
		escreva("2 - Ver lista de números\n")
		escreva("3 - Embaralhar números com fisher yates\n")
		escreva("4 - Organizar com bublle sort\n")
		escreva("5 - Organizar com merge sort\n")
		escreva("6 - Sair\n\n")
		
		escreva("Opção ")
		leia(opcao)

		menu()
		
	}

	funcao menu()
	{
		limpa()
		escolha(opcao)
		{
			caso 1:
			{
				preencher()
				pare
			}

			caso 2:
			{
				listar()
				pare
			}
			caso 3:
			{
				embaralhar()
				pare
			}
			caso 4:
			{
				bublle_sort()
				pare
			}
			caso 5:
			{
				escreva("Organizando vetor com método Merge Sort:\n\n")
				
				comeco_contagem = 0
				fim_contagem = 0
				
				comeco_contagem = u.tempo_decorrido()
				
				merge_sort(numero, 0, tamanho - 1)

				fim_contagem = u.tempo_decorrido()
		
				escreva("Tempo decorrido: ", fim_contagem - comeco_contagem, " Milissegundos\n\n")
				
			 	escreva("\nPressione [ENTER] para voltar ao menu \n")
				leia(enter)

				limpa()
				inicio()
				pare	
			}
			caso 6:
			{
				sair()
				pare
			}
			caso 7:
			{
				n = 0

				g.iniciar_modo_grafico(verdadeiro)
				g.definir_cor(0x67C2E6)
				g.definir_dimensoes_janela(largura_janela, altura_janela)
	
				g.definir_fonte_texto("Arial")
         		 	g.definir_titulo_janela("SITUAÇÃO DE APREDIZAGEM 6 ETAPA 1 -- BUBLLE SORT --")

          		contador = u.numero_elementos(numeros)
          		enquanto(nao t.tecla_pressionada(t.TECLA_ENTER))
          		{
          			definir_tela()
          			definir_tela_enter()
          			g.renderizar()
          		}

				enquanto(nao t.tecla_pressionada(t.TECLA_ESC))
				{
					
					bubllesort_modo_grafico()
		     		desenhar()
		     		g.renderizar()
		     		ponteiro++
		     		u.aguarde(5)	
				} 
	
			}

			caso contrario:
			{
				escreva("ATENCÃO: OPÇÃO INVÁLIDA")
			}
			
		}
	}
	funcao preencher()
	{
		comeco_contagem = 0
		fim_contagem = 0
		
		escreva("PREENCHER \n\n")

		comeco_contagem = u.tempo_decorrido()
		
		para(n = 0 ; n < tamanho; n++)
		{
			numero[n] = n + 1
			
		}
		
		fim_contagem = u.tempo_decorrido()
		
		escreva("Salvando os numeros.") u.aguarde(100) 
		escreva(".") u.aguarde(100) 
		escreva(".") u.aguarde(100)

		limpa()
		escreva("PREENCHER \n\n")
		escreva("Números salvos com sucesso\n\n")
		
		escreva("Tempo decorrido: ", fim_contagem - comeco_contagem, " Milissegundos\n\n")
		
		escreva("Pressione [ENTER] para voltar ao menu \n")
		leia(enter)
		
		limpa()
		inicio()
	}

	funcao listar()
	{
		escreva("Listando os primeiros 50 números do vetor: \n\n")

		se(tamanho > 0 e tamanho <= 50)
		{
			para(inteiro listagem = 0; listagem < total; listagem++)
			{
				
				escreva(numero[listagem], " ")
			
			}
			
			escreva("\n\nPressione [ENTER] para voltar ao menu\n")
			leia(enter)

			limpa()
			inicio()	
		}
		senao se(tamanho > 50)
		{
			para(inteiro listagem = 0; listagem < 50; listagem++)
			{
				
				escreva(numero[listagem], " ")
				
			}
			
			
			escreva("\n\nPressione [ENTER] para voltar ao menu \n")
			leia(enter)

			limpa()
			inicio()	
		}
		senao
		{
			escreva("Nenhum número foi adicionado até o momento!")
		}
	}

	funcao embaralhar()
	{
		comeco_contagem = 0
		fim_contagem = 0

		escreva("Embaralhando vetor com método Fisher-Yates:\n\n")
		
		comeco_contagem = u.tempo_decorrido()
		
		para(n = tamanho - 1; n >= 0; n--)
		{
			 c = u.sorteia(0, tamanho - 1)
			auxiliar = numero[n]
  			numero[n] = numero[c]
  			numero[c] = auxiliar
		}
		
		fim_contagem = u.tempo_decorrido()
		
		escreva("Tempo decorrido: ", fim_contagem - comeco_contagem, " Milissegundos\n\n")
		
		escreva("\nPressione [ENTER] para voltar ao menu \n")
		leia(enter)

		limpa()
		inicio()
		
	}

	funcao bublle_sort()
	{ 	
		total = tamanho
		comeco_contagem = 0
		fim_contagem = 0
		
		escreva("Organizando vetor com método Bublle Sort:\n\n")

		comeco_contagem = u.tempo_decorrido()
		
		para(n = 0; n < tamanho; n++)
		{
			para(c = 0; c < total - 1; c++ )
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
		
		escreva("Tempo decorrido: ", fim_contagem - comeco_contagem, " Milissegundos\n\n")

		escreva("\nPressione [ENTER] para voltar ao menu \n")
		leia(enter)

		limpa()
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
	funcao sair()
	{
		caracter resposta
		
		limpa()
		escreva("Tem certeza que vai sair? [S/N]\n")
		leia(resposta)
		
		se(resposta == 'S' ou resposta == 's')
		{
			limpa()
			escreva("Finalizando o sistema em 05 segundos. . .")
			Util.aguarde(1000)
	
			limpa()
			escreva("Finalizando o sistema em 04 segundos. . .")
			Util.aguarde(1000)
	
			limpa()
			escreva("Finalizando o sistema em 03 segundos. . .")
			Util.aguarde(1000)
	
			limpa()
			escreva("Finalizando o sistema em 02 segundos. . .")
			Util.aguarde(1000)
	
			limpa()
			escreva("Finalizando o sistema em 01 segundos. . .")
			Util.aguarde(1000)
	
			limpa()
			escreva("Sistema finalizado com sucesso!\n\n\n\n\n")
		}
		senao
		{
			inicio()
		}
	}

	funcao bubllesort_modo_grafico()
	{
		se( n == 18)
		{
			n = 0
		}
		se(ponteiro < 55)
		{
			
			se(numeros[n] > numeros[n + 1])
			{
				posicao[n] += ponteiro
				posicao[n + 1] -= ponteiro
			}
		}
		senao
		{
			se(n < 18)
			{
				n++
			}
			se(numeros[n] > numeros[n + 1])
			{
				auxiliar_troca = numeros[n + 1]
				numeros[n + 1] = numeros[n]
				numeros[n] = auxiliar_troca

				auxiliar_troca = palheta_de_cores[n + 1]
				palheta_de_cores[n + 1] = palheta_de_cores[n]
				palheta_de_cores[n] = auxiliar_troca
			}
		
			ponteiro = 0
			
			bubllesort_modo_grafico()
		}
	}

	funcao desenhar()
	{
		definir_tela()
		
		para( i = 0; i < contador; i++)
		{
			texto[i] = tp.inteiro_para_cadeia(numeros[i], 10)
			
			g.definir_cor(g.COR_PRETO)
			g.desenhar_retangulo((60 + i * (largura_bloco + 2)) + posicao[i], 450 - (numeros[i] * 3 + 50)  , largura_bloco, numeros[i] * 3 + 50, verdadeiro, verdadeiro)
			
			g.definir_cor(palheta_de_cores[i])
			g.desenhar_retangulo((63 + i * (largura_bloco + 2)) + posicao[i], 450 - (numeros[i] * 3 + 50) + 3  , largura_bloco - 6, (numeros[i] * 3 + 50) - 6, verdadeiro, verdadeiro)

			g.definir_cor(g.COR_PRETO)
			g.definir_estilo_texto(falso, verdadeiro, falso)
			g.definir_tamanho_texto(32.0)
			
			se(numeros[i] < 10)
			{
				g.desenhar_texto( (64 + 3 +(i * (largura_bloco + 2))+ posicao[i]), 450, "0"+texto[i])
			}
			senao
			{
				g.desenhar_texto( (64 + 3 +(i * (largura_bloco + 2))+ posicao[i]), 450, texto[i])
			}
			
		}
		
	}

	funcao definir_tela()
	{
		g.definir_cor(0x32C1ED)
		g.desenhar_retangulo(0, 0, 1200, 800, falso, verdadeiro)

		g.definir_cor(0x3B32ED)
		g.desenhar_retangulo(0, 760, 1200, 40, falso, verdadeiro)
		
		g.definir_cor(g.COR_PRETO)
		g.definir_estilo_texto(falso, verdadeiro, falso)
		g.definir_fonte_texto("Tahoma")
		g.definir_tamanho_texto(100.0)
		g.desenhar_texto(320, 600, "Bublle Sort")

		g.definir_cor(g.COR_BRANCO)
		g.definir_fonte_texto("Arial")
		g.definir_estilo_texto(verdadeiro, verdadeiro, falso)
		g.definir_tamanho_texto(22.0)
		g.desenhar_texto(48, 769, "Criado e desenvolvido por :")
		g.definir_estilo_texto(verdadeiro, falso, falso)
		g.definir_tamanho_texto(18.0)
		g.desenhar_texto(334, 771, "Jonathan Reinaldo Eichenberger e Felipe Fernandes Ribeiro Vulgo ' Fan Boy '")
	}

	funcao definir_tela_enter()
	{
		g.definir_cor(g.COR_PRETO)
		g.definir_estilo_texto(falso, verdadeiro, falso)
		g.definir_fonte_texto("Comic Sans")
		g.definir_tamanho_texto(40.0)
		g.desenhar_texto(320, 400, "Pressione ENTER para começar")
	}
}


/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 9541; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */