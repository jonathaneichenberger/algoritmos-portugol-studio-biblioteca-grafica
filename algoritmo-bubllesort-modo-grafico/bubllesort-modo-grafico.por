programa
{
	inclua biblioteca Teclado --> t
	inclua biblioteca Graficos --> g
	inclua biblioteca Util --> u
	

	inteiro largura_janela = 1200
	inteiro altura_janela = 800
	inteiro n1 =  12, n2 = 36
	inteiro ponteiro = 0
	inteiro ponteiro2 = 0
	funcao inicio()
	{
		g.iniciar_modo_grafico(verdadeiro)
		g.definir_cor(0x67C2E6)
		g.definir_dimensoes_janela(largura_janela, altura_janela)
	
		g.definir_fonte_texto("Arial")
          g.definir_titulo_janela("BUBLLE SORT")

		enquanto(nao t.tecla_pressionada(t.TECLA_ESC))
		{
			 enquanto(ponteiro < 65)
          	{
          		bubllesort()
          		g.renderizar()

          	}
          	enquanto(ponteiro2 < 65)
          	{
          		bubllesort2()
          		g.renderizar()
          	}
       
          	ponteiro = 0
          	ponteiro2 = 0
		}
         

          
	}

	funcao bubllesort()
	{
		g.definir_cor(0x67C2E6)
		g.desenhar_retangulo(0, 0, 1200, 800, falso, verdadeiro)

		g.definir_cor(g.COR_PRETO)
		g.definir_estilo_texto(falso, verdadeiro, falso)
		g.definir_fonte_texto("Tahoma")
		g.definir_tamanho_texto(100.0)
		g.desenhar_texto(320, 600, "Bublle Sort")

		
		
			g.definir_cor(0xE5422A)
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

	}

	funcao bubllesort2()
	{

		g.definir_cor(0x67C2E6)
		g.desenhar_retangulo(0, 0, 1200, 800, falso, verdadeiro)

		g.definir_cor(g.COR_PRETO)
		g.definir_estilo_texto(falso, verdadeiro, falso)
		g.definir_fonte_texto("Tahoma")
		g.definir_tamanho_texto(100.0)
		g.desenhar_texto(320, 600, "Bublle Sort")
		
		
		g.definir_cor(0xA567E6)
		g.desenhar_retangulo(538 + ponteiro2, 100, 60 , 300, verdadeiro, verdadeiro)
		
		g.definir_cor(g.COR_PRETO)
		g.desenhar_retangulo(538 + ponteiro2, 100, 60 , 300, verdadeiro, falso)

		g.definir_cor(g.COR_PRETO)
		g.desenhar_retangulo(539 + ponteiro2, 101, 58 , 298, verdadeiro, falso)
		
		g.definir_tamanho_texto(40.0)
		g.desenhar_texto(540 + ponteiro2, 355, "30")
		
		g.definir_cor(0xE5422A)
		g.desenhar_retangulo(600 + 2 - ponteiro2, 300  , 60, 100, verdadeiro, verdadeiro)
	
		g.definir_cor(g.COR_PRETO)
		g.desenhar_retangulo(600 + 2 - ponteiro2, 300  , 60, 100, verdadeiro, falso)

		g.definir_cor(g.COR_PRETO)
		g.desenhar_retangulo(600 + 3 - ponteiro2, 299  , 58, 100, verdadeiro, falso)
		
		g.definir_tamanho_texto(40.0)
		g.desenhar_texto(600 + 6 - ponteiro2, 355, "10")
		
		

		ponteiro2++

		u.aguarde(50)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 2488; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {ponteiro, 11, 9, 8}-{ponteiro2, 12, 9, 9};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */