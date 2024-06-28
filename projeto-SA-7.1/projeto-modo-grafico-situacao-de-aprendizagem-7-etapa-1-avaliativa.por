programa
{
	inclua biblioteca Tipos --> tp
	inclua biblioteca Calendario --> c
	inclua biblioteca Util --> u
	inclua biblioteca Mouse --> m
	inclua biblioteca Graficos --> g
	inclua biblioteca Texto --> txt
	inclua biblioteca Teclado --> t

	//Definiçoes de tela e proporção
	inteiro largura_tela = 1200
	inteiro altura_tela = 800

	//Variaveis das imagens carregadas
	inteiro sweet_flight = 0
	inteiro aviao = 0
	inteiro fundo_menu = 0
	inteiro icone_aviao = 0
	inteiro icone_aviao_grande = 0
	

	//Outras variaveis
	inteiro opcao = 0
	cadeia hora
	cadeia minuto
	cadeia segundo
	cadeia hora_atual
	cadeia aviao_numero[4]
	inteiro assentos_disponiveis[4]
	inteiro transparencia = 255
	
	funcao inicio()
	{	
		inicializar()
		
		faca
		{
			escolha(opcao)
			{
				caso 0:
				{
					menu()
					g.renderizar()
					pare
				}
				caso 1:
				{
					
						
					pare
				}
				caso 2:
				{

					pare
				}
				caso 3:
				{

					pare
				}
				caso 4:
				{

					pare
				}
				caso 5:
				{
					tela_inicial_final()
					g.renderizar()
					pare
				}
			}
			
		}enquanto(nao t.tecla_pressionada(t.TECLA_ESC))
	}

	funcao menu()
	{
		inteiro temp_click

		
		
		//Quadros de opções no menu
		g.definir_cor(g.COR_BRANCO)
		g.limpar()
		g.definir_opacidade(255)
		
		g.definir_gradiente(g.GRADIENTE_ABAIXO, 0x0013A6, g.COR_BRANCO)
		g.desenhar_retangulo(500, 80, 650, 120, verdadeiro, verdadeiro)
		g.desenhar_retangulo(500, 220, 650, 120, verdadeiro, verdadeiro)
		g.desenhar_retangulo(500, 360, 650, 120, verdadeiro, verdadeiro)
		g.desenhar_retangulo(500, 500, 650, 120, verdadeiro, verdadeiro)
		g.desenhar_retangulo(500, 640, 650, 120, verdadeiro, verdadeiro)

		se(m.posicao_x() >= 500 e m.posicao_x() <= 1150 e m.posicao_y() >= 80 e m.posicao_y() <= 200)
		{
			g.definir_cor(0xB6D7FA)
			g.desenhar_retangulo(497, 77, 656, 126, verdadeiro, verdadeiro)
			g.definir_cor(0x2F76FA)
			g.desenhar_retangulo(500, 80, 650, 120, verdadeiro, verdadeiro)
			
		}
		se(m.posicao_x() >= 500 e m.posicao_x() <= 1150 e m.posicao_y() >= 220 e m.posicao_y() <= 340)
		{
			g.definir_cor(0xB6D7FA)
			g.desenhar_retangulo(497, 217, 656, 126, verdadeiro, verdadeiro)
			g.definir_cor(0x2F76FA)
			g.desenhar_retangulo(500, 220, 650, 120, verdadeiro, verdadeiro)
		}
		se(m.posicao_x() >= 500 e m.posicao_x() <= 1150 e m.posicao_y() >= 360 e m.posicao_y() <= 480)
		{
			g.definir_cor(0xB6D7FA)
			g.desenhar_retangulo(497, 357, 656, 126, verdadeiro, verdadeiro)
			g.definir_cor(0x2F76FA)
			g.desenhar_retangulo(500, 360, 650, 120, verdadeiro, verdadeiro)
		}
		se(m.posicao_x() >= 500 e m.posicao_x() <= 1150 e m.posicao_y() >= 500 e m.posicao_y() <= 620)
		{
			g.definir_cor(0xB6D7FA)
			g.desenhar_retangulo(497, 497, 656, 126, verdadeiro, verdadeiro)
			g.definir_cor(0x2F76FA)
			g.desenhar_retangulo(500, 500, 650, 120, verdadeiro, verdadeiro)
		}
		se(m.posicao_x() >= 500 e m.posicao_x() <= 1150 e m.posicao_y() >= 640 e m.posicao_y() <= 760)
		{
			g.definir_cor(0xB6D7FA)
			g.desenhar_retangulo(497, 637, 656, 126, verdadeiro, verdadeiro)
			g.definir_cor(0x2F76FA)
			g.desenhar_retangulo(500, 640, 650, 120, verdadeiro, verdadeiro)
		}

		//Desenhar logo
		g.definir_cor(g.COR_PRETO)
		g.desenhar_elipse(120, 25, 200, 200, verdadeiro)
		g.definir_cor(g.COR_BRANCO)
		g.desenhar_elipse(140, 45, 160, 160, verdadeiro)
		g.desenhar_retangulo(0, 85, 500, 80, verdadeiro, verdadeiro)
		g.desenhar_imagem(180, 85, icone_aviao)
		g.definir_cor(g.COR_PRETO)
		g.definir_estilo_texto(falso, verdadeiro, falso)
		g.definir_tamanho_texto(40.0)
		g.desenhar_texto(0, 105, " SWEET")
		g.desenhar_texto(286, 105, "FLIGHT")

		//definindo plano de fundo e opacidade para os elemntos anteriores sobreporem a imagem
		g.definir_opacidade(120)
		g.desenhar_imagem(0, 0, fundo_menu)
		
		//horario()
		
		//g.definir_fonte_texto("arial")
		
		g.definir_opacidade(255)
	
		g.definir_cor(g.COR_PRETO)
		g.definir_estilo_texto(falso, verdadeiro, falso)
		g.definir_tamanho_texto(40.0)
		g.desenhar_texto(500, 120, "  NÚMERO DOS AVIÕES")
		g.desenhar_texto(500, 260, "  ASSENTOS DISPONÍVEIS")
		g.desenhar_texto(500, 400, "  RESERVAR PASSAGEM AÉREA")
		g.desenhar_texto(500, 540, "  REALIZAR CONSULTA")
		g.desenhar_texto(500, 680, "  SAIR DO PROGRAMA")

		se(m.algum_botao_pressionado())
		{
			temp_click = m.ler_botao()

			se(temp_click == m.BOTAO_ESQUERDO e m.posicao_x() >= 500 e m.posicao_x() <= 1150 e m.posicao_y() >= 80 e m.posicao_y() <= 200)
			{
				opcao = 1
			}
			se(temp_click == m.BOTAO_ESQUERDO e m.posicao_x() >= 500 e m.posicao_x() <= 1150 e m.posicao_y() >= 220 e m.posicao_y() <= 340)
			{
				opcao = 2
			}
			se(temp_click == m.BOTAO_ESQUERDO e m.posicao_x() >= 500 e m.posicao_x() <= 1150 e m.posicao_y() >= 360 e m.posicao_y() <= 480)
			{
				opcao = 3
			}
			se(temp_click == m.BOTAO_ESQUERDO e m.posicao_x() >= 500 e m.posicao_x() <= 1150 e m.posicao_y() >= 500 e m.posicao_y() <= 620)
			{
				opcao = 4
			}
			se(temp_click == m.BOTAO_ESQUERDO e m.posicao_x() >= 500 e m.posicao_x() <= 1150 e m.posicao_y() >= 640 e m.posicao_y() <= 760)
			{
				opcao = 5
			}
			
			
			

		}
			
	}

	funcao tela_inicial_final()
	{
	
		g.definir_opacidade(255)
		g.definir_cor(g.COR_BRANCO)
		g.desenhar_elipse(350, 150, 500, 500, verdadeiro)
		g.definir_cor(g.COR_PRETO)
		g.desenhar_elipse(375, 175, 450, 450, verdadeiro)
		g.desenhar_retangulo(0, 300, 1200, 200, verdadeiro, verdadeiro)
		
		g.desenhar_imagem(500, 300, icone_aviao_grande)
		
		g.definir_cor(g.COR_BRANCO)
		g.definir_estilo_texto(falso, verdadeiro, falso)
		g.definir_tamanho_texto(100.0)
		g.desenhar_texto(40, 350, " SWEET")
		g.desenhar_texto(770, 350, "FLIGHT")

		se(transparencia <= 255)
		{

			se(transparencia >= 0)
			{
				g.definir_opacidade(transparencia)
				g.desenhar_imagem(0, 0, fundo_menu)
				u.aguarde(5)
				transparencia--
			}
		}
	
	}

	funcao horario()
	{
		
		se(c.hora_atual(falso) < 10)
		{
			hora = "0" + tp.inteiro_para_cadeia(c.hora_atual(falso), 10)
		}
		senao se(c.minuto_atual() < 10)
		{
			minuto = "0" + tp.inteiro_para_cadeia(c.minuto_atual(), 10)
		}
		senao se(c.segundo_atual() < 10)
		{
			segundo =  "0" + tp.inteiro_para_cadeia(c.segundo_atual(), 10)
		}
		senao
		{
			hora = tp.inteiro_para_cadeia(c.hora_atual(falso), 10)	
			minuto = tp.inteiro_para_cadeia(c.minuto_atual(), 10)
			segundo = tp.inteiro_para_cadeia(c.segundo_atual(), 10)
		}
		
		hora_atual = hora + ":" + minuto + ":" + segundo

		g.definir_cor(g.COR_PRETO)
		g.definir_opacidade(255)
		g.definir_fonte_texto("alarm clock")
		g.definir_estilo_texto(falso, falso, falso)
		g.definir_tamanho_texto(30.0)
		
		g.desenhar_texto(1190 - g.largura_texto(hora_atual), 10 , hora_atual)

	}

	funcao inicializar()
	{
		g.iniciar_modo_grafico(verdadeiro)
		g.definir_dimensoes_janela(largura_tela, altura_tela)
		
		carregar_imagens()
		carregar_fontes()
	}

	funcao carregar_imagens()
	{
		//A variavel temp_img vai receber temporariamente o valor do espaço de memória para carregar as imagens
		inteiro temp_img = 0

		//temp_img recebe o endereço de memória vindo do endereço passado
		temp_img = g.carregar_imagem("./imagens/sweet_flight.png")
		//sweet_flight recebe a imagem com os dimensionamentos de "largura" e "altura" e qualidade "verdadeiro"
		sweet_flight = g.redimensionar_imagem(temp_img, 500, 250, verdadeiro)
		g.liberar_imagem(temp_img)

		temp_img = g.carregar_imagem("./imagens/fundo_menu.jpg")
		fundo_menu = g.redimensionar_imagem(temp_img, 1200, 800, verdadeiro)
		g.liberar_imagem(temp_img)

		temp_img = g.carregar_imagem("./imagens/icone_aviao.png")
		icone_aviao = g.redimensionar_imagem(temp_img, 80, 80, verdadeiro)
		g.liberar_imagem(temp_img)

		temp_img = g.carregar_imagem("./imagens/icone_aviao_grande.png")
		icone_aviao_grande = g.redimensionar_imagem(temp_img, 200, 200, verdadeiro)
		g.liberar_imagem(temp_img)
	}

	funcao carregar_fontes()
	{
		g.carregar_fonte("./fontes/alarm_clock.ttf")
	}

}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 3800; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {opcao, 24, 9, 5}-{transparencia, 31, 9, 13};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */