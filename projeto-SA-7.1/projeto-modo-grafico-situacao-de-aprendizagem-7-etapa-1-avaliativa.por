programa
{
	inclua biblioteca Util --> u
	inclua biblioteca Mouse --> m
	inclua biblioteca Graficos --> g
	inclua biblioteca Texto --> txt
	inclua biblioteca Teclado -->t

	inteiro largura_tela = 500
	inteiro altura_tela = 600
	
	funcao inicio()
	{
		inicializar()
		carregar_imagens()
		
		enquanto(nao t.tecla_pressionada(t.TECLA_ESC))
		{
			
		}
	}

	funcao inicializar()
	{
		g.iniciar_modo_grafico(verdadeiro)
		g.definir_dimensoes_janela(largura_tela, altura_tela)
		
	}

	funcao carregar_imagens()
	{
		inteiro temp_img = 0

		g.carregar_imagem(")
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 561; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */