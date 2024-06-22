/*
Alunos: Jonathan Reinaldo Eichenberger e Felipe
Curso: Desenvolvimento de sistemas
Mﾃｳdulo: Lﾃｳgica de Programaﾃｧﾃ｣o
Professor: Christian Daniel Licnerski Marques Pinheiro
Tipo de Entrega: Nﾃ｣o Avaliativa
Atividade: Stiuaﾃｧﾃ｣o de Aprendizagem 6 - Etapa 1
*/


programa
{
	inclua biblioteca Matematica --> m

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
	inteiro total_grafico = 0

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
	inteiro carregar_fontes = 0
	inteiro alternar_enter = 0
	inteiro limite_vetor = 18
	real tempo_bubllesort[20]
	real tempo_mergesort[20]
	inteiro ponteiro_bubllesort = 0
	inteiro ponteiro_mergesort = 0
	real tamanho_vetor[20]
	inteiro incremento_posicao_vetor = 0
	inteiro total_final = 0
	
	funcao inicio()
	{
		n = 0

		iniciar_modo_grafico()

		g.definir_fonte_texto("Arial")
		g.definir_titulo_janela("SITUAÇÃO DE APREDIZAGEM 6 ETAPA 1 -- BUBLLE SORT --")
		
		enquanto(nao t.tecla_pressionada(t.TECLA_ESC))
		{	
			bubllesort_modo_grafico()
     		desenhar()
     		g.renderizar()
     		ponteiro++   		
		} 
	}

	funcao bubllesort_modo_grafico()
	{
		se( n == limite_vetor)
		{
			n = 0
			se(limite_vetor > 0)
			{
				limite_vetor--
			}
			
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
			se(n < limite_vetor)
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
			g.definir_fonte_texto("Arial")
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
			se(limite_vetor == 0)
			{
		
				se(alternar_enter <= 200)
				{
					g.definir_cor(g.COR_PRETO)
					g.definir_estilo_texto(falso, verdadeiro, falso)
					g.definir_fonte_texto("Star Jedi")
					g.definir_tamanho_texto(40.0)
					g.desenhar_texto(180, 30, "vetor totalmente ordenado ! ! !")
					u.aguarde(5)
					alternar_enter++
					
				}
				senao se(alternar_enter > 200 e alternar_enter < 300)
				{
					u.aguarde(5)
					alternar_enter++
				}
				senao se(alternar_enter >=  300)
				{
					alternar_enter = 0
				}
			}
		}
	}

	funcao definir_tela()
	{
		se(carregar_fontes == 0)
		{
			g.carregar_fonte("./fontes/poetsen_one_regular.ttf")
			g.carregar_fonte("./fontes/Starjedi.ttf")
			g.carregar_fonte("./fontes/Starjhol.ttf")
		}
		
		g.definir_cor(0x32C1ED)
		g.desenhar_retangulo(0, 0, 1200, 800, falso, verdadeiro)

		g.definir_cor(g.COR_PRETO)
		g.desenhar_retangulo(0, 760, 1200, 40, falso, verdadeiro)

		g.definir_cor(g.COR_PRETO)
		g.desenhar_retangulo(162, 567, 876, 166, verdadeiro, verdadeiro)

		g.definir_cor(0x3A00DD)
		g.desenhar_retangulo(165, 570, 870, 160, verdadeiro, verdadeiro)
		
		
		g.definir_cor(g.COR_BRANCO)
		g.definir_estilo_texto(falso, verdadeiro, falso)
		g.definir_fonte_texto("Star Jedi Hollow")
		g.definir_tamanho_texto(100.0)
		g.desenhar_texto(190, 600, "Bublle Sort")

		g.definir_cor(g.COR_BRANCO)
		g.definir_fonte_texto("Arial")
		g.definir_estilo_texto(verdadeiro, verdadeiro, falso)
		g.definir_tamanho_texto(22.0)
		g.desenhar_texto(170, 769, "Criado e desenvolvido por : ")
		g.definir_estilo_texto(verdadeiro, falso, falso)
		g.definir_tamanho_texto(22.0)
		g.desenhar_texto(456, 771, "Jonathan Reinaldo Eichenberger e Felipe Fernandes Ribeiro")
		
	}

	funcao definir_tela_enter()
	{
		se(alternar_enter <= 400)
		{
			g.definir_cor(g.COR_PRETO)
			g.definir_estilo_texto(falso, verdadeiro, falso)
			g.definir_fonte_texto("Star Jedi")
			g.definir_tamanho_texto(40.0)
			g.desenhar_texto(210, 400, "Pressione ENTER para comeﾃｧar")
			alternar_enter++
			
		}
		senao se(alternar_enter > 400 e alternar_enter < 600)
		{
			
			alternar_enter++
		}
		senao se(alternar_enter ==  600)
		{
			alternar_enter = 0
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
 * @POSICAO-CURSOR = 5359; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {tamanho_vetor, 55, 6, 13}-{total_final, 57, 9, 11};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */