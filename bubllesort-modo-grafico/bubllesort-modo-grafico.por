programa
{
	inclua biblioteca Tipos --> tp
	inclua biblioteca Teclado --> t
	inclua biblioteca Graficos --> g
	inclua biblioteca Util --> u
	
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
	inteiro n = 0
	inteiro auxiliar_troca = 0
	inteiro i = 0
	
	

	
	
	
	funcao inicio()
	{
		g.iniciar_modo_grafico(verdadeiro)
		g.definir_cor(0x67C2E6)
		g.definir_dimensoes_janela(largura_janela, altura_janela)
	
		g.definir_fonte_texto("Arial")
          g.definir_titulo_janela("BUBLLE SORT")

          contador = u.numero_elementos(numeros)

		
			enquanto(nao t.tecla_pressionada(t.TECLA_ESC))
			{
				bubllesort()
	     		desenhar()
	     		g.renderizar()
	     		ponteiro++
	     		u.aguarde(5)	
			} 
	
		
	}

	funcao definir_tela()
	{
		g.definir_cor(0x67C2E6)
		g.desenhar_retangulo(0, 0, 1200, 800, falso, verdadeiro)
		
		g.definir_cor(g.COR_PRETO)
		g.definir_estilo_texto(falso, verdadeiro, falso)
		g.definir_fonte_texto("Tahoma")
		g.definir_tamanho_texto(100.0)
		g.desenhar_texto(320, 600, "Bublle Sort")
		
	}

	funcao bubllesort()
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
			bubllesort()
		}
	}

	funcao desenhar()
	{
		definir_tela()
		
		para( i = 0; i < contador; i++)
		{
			texto[i] = tp.inteiro_para_cadeia(numeros[i], 10)
			
			g.definir_cor(g.COR_PRETO)
			g.desenhar_retangulo((60 + i * (largura_bloco + 2)) + posicao[i], 400 - (numeros[i] * 3 + 50)  , largura_bloco, numeros[i] * 3 + 50, verdadeiro, verdadeiro)
			
			g.definir_cor(palheta_de_cores[i])
			g.desenhar_retangulo((63 + i * (largura_bloco + 2)) + posicao[i], 400 - (numeros[i] * 3 + 50) + 3  , largura_bloco - 6, (numeros[i] * 3 + 50) - 6, verdadeiro, verdadeiro)

			g.definir_cor(g.COR_PRETO)
			g.definir_tamanho_texto(32.0)
			
			se(numeros[i] < 10)
			{
				g.desenhar_texto( (60 + 3 +(i * (largura_bloco + 2))+ posicao[i]), 400, "0"+texto[i])
			}
			senao
			{
				g.desenhar_texto( (60 + 3 +(i * (largura_bloco + 2))+ posicao[i]), 400, texto[i])
			}
			
		}
		
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1208; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */