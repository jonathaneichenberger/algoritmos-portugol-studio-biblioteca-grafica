programa
{
	inclua biblioteca Tipos --> tp
	inclua biblioteca Teclado --> t
	inclua biblioteca Graficos --> g
	inclua biblioteca Util --> u
	
	
	inteiro numeros[20] = {01, 07, 10, 09, 02, 03, 20, 18, 33, 90, 44, 34, 30, 21, 27, 05, 08, 99, 54, 68}
	inteiro largura_janela = 1200
	inteiro altura_janela = 800
	inteiro ponteiro1 = 0
	inteiro ponteiro2 = 0
	inteiro contador = 0
	inteiro ponteiro = 0
	inteiro auxiliar_troca
	inteiro largura_bloco = 50
	inteiro altura_bloco
	inteiro largura_cor_bloco = 48
	inteiro altura_cor_bloco
	cadeia texto
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
     		g.renderizar()     
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
		
		definir_tela()

		para(inteiro i = 0; i < contador; i++)
		{
			altura_bloco = numeros[i] * 3 + 50
			texto = tp.inteiro_para_cadeia(numeros[i], 10)
			
			g.definir_cor(g.COR_PRETO)
			g.desenhar_retangulo(60 + (i * (largura_bloco + 4)) , 400 - altura_bloco  , largura_bloco, altura_bloco, verdadeiro, verdadeiro)

			g.definir_cor(0xE5422A)
			g.desenhar_retangulo(63 + (i * (largura_bloco + 4)) , 400 - altura_bloco + 3  , largura_bloco - 6, altura_bloco - 6, verdadeiro, verdadeiro)

			g.definir_cor(g.COR_PRETO)
			g.definir_tamanho_texto(40.0)
			g.desenhar_texto( 63 + (i * largura_bloco + 6), 355, texto)
		
		}

		/*g.definir_cor(0xE5422A)
		g.desenhar_retangulo(600 - 62 + ponteiro, 300  , 60, 100, verdadeiro, verdadeiro)
		
		g.definir_cor(g.COR_PRETO)
		g.desenhar_retangulo(600 - 62 + ponteiro, 300  , 60, 100, verdadeiro, falso)

		g.definir_cor(g.COR_PRETO)
		g.desenhar_retangulo(600 - 61 + ponteiro, 299  , 58, 100, verdadeiro, falso)

		g.definir_tamanho_texto(40.0)
		g.desenhar_texto(600 - 58 + ponteiro, 355, "10")

		

		g.definir_cor(0xA567E6)
		g.desenhar_retangulo(600 + 2 - ponteiro, 100, 60 , 300, verdadeiro, verdadeiro)
		
		g.definir_cor(g.COR_PRETO)
		g.desenhar_retangulo(600 + 2 - ponteiro, 100, 60 , 300, verdadeiro, falso)

		g.definir_cor(g.COR_PRETO)
		g.desenhar_retangulo(600 + 3 - ponteiro, 101, 58 , 298, verdadeiro, falso)

		g.desenhar_texto(600 + 6 - ponteiro, 355, "30")
		
		
		ponteiro++

		u.aguarde(50)

		para(inteiro i = contador; i > 0 ; i--)
		{
			para(inteiro n = 0; n < contador - 1; n++)
			{
				se(numeros[n] > numeros[n + 1])
				{
					auxiliar_troca = numeros[n + 1]
					numeros[n + 1] = numeros[n]
					numeros[n] = auxiliar_troca
				}
			}
		}

	*/
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1390; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */