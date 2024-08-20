programa
{
	inclua biblioteca Teclado --> t
	inclua biblioteca Mouse --> m
	inclua biblioteca Texto --> txt
	inclua biblioteca Util --> u
	inclua biblioteca Graficos --> g
	
	const inteiro total = 20

	//Definições de tamanhos para as janelas
	inteiro largura_janela = 400
	inteiro altura_janela = 720
	inteiro borda_esquerda = 100
	inteiro borda_direita = 30

	//Imagens que serão carregadas no algoritmo
	inteiro temp_img 
	inteiro senai_logo = 0
	inteiro tela_celular = 0
	inteiro botao_adicionar = 0
	inteiro remover_ultimo_livro = 0
	inteiro remover_tudo = 0
	inteiro pilha_livros = 0
	inteiro lista_vazia = 0
	inteiro sair_do_programa = 0
	inteiro icone_alerta = 0
	inteiro botao_voltar = 0
	inteiro logo_harry_potter = 0
	inteiro pedra_filosofal = 0
	inteiro prisioneiro_de_azkaban = 0
	inteiro camara_secreta = 0
	inteiro calice_de_fogo = 0
	inteiro enigma_do_principe = 0
	inteiro ordem_da_fenix = 0
	inteiro capa_pedra_filosofal = 0
	inteiro capa_prisioneiro_de_azkaban = 0
	inteiro capa_camara_secreta = 0
	inteiro capa_calice_de_fogo = 0
	inteiro capa_enigma_do_principe = 0
	inteiro capa_ordem_da_fenix = 0
	inteiro botao_negar = 0
	inteiro botao_confirmar = 0
	inteiro senai_logo_carregamento = 0
	inteiro logo_game_of_thrones = 0
	inteiro game_of_thrones = 0
	inteiro clash_of_kings = 0
	inteiro feast_for_crows = 0
	inteiro storm_of_swords = 0
	inteiro dance_with_dragons = 0
	inteiro capa_game_of_thrones = 0
	inteiro capa_clash_of_kings = 0
	inteiro capa_feast_for_crows = 0
	inteiro capa_storm_of_swords = 0
	inteiro capa_dance_with_dragons = 0

	
	//Outras variaveis necessarias
	inteiro ponteiro = 0
	inteiro livros[total]
	cadeia nome_livros[total]
	inteiro opcao = 0
	real fonte_padrao = 20.0
	cadeia titulo
	cadeia mensagem1, mensagem2
	inteiro digitar = 0
	cadeia texto
	inteiro lista_colecoes = 0
	inteiro voltar = 0
	inteiro loading = 0
	inteiro aparecer_logo = 0
	inteiro definir_tela_inicio = 0
	inteiro tamanho_texto = 0
	inteiro carregamento_inicial = 0
	inteiro aux_loading = 0
	
	funcao inicio()
	{
		se(definir_tela_inicio == 0)
		{
			definir_tela()
			carregar_imagens()
			definir_tela_inicio++
		}
    
         	enquanto(loading < 276 e carregamento_inicial == 0)
          {
          	tela_carregamento()
          	g.renderizar()
          	
          }
	
		escolha(opcao)
		{
			caso 0:
			{
				enquanto(opcao == 0)
				{
					menu()
       				g.renderizar()
       				
				}
			}
			
			caso 1:
			{	
				enquanto(opcao == 1)
				{
					
					empilhar()
				     g.renderizar()
				     
				}
			}
			
			caso 2:
			{	
				enquanto(opcao == 2)
				{
					
					desempilhar()
				     g.renderizar()
				     
				}
			}
			caso 3:
			{

				enquanto(opcao == 3)
				{
					remover_todos_livros()
					g.renderizar()
				}
			}
			
			caso 4:
			{
				enquanto(opcao == 4)
				{
					
					listar_pilha()
				     g.renderizar()
				     
				}
			}

			caso 5:
			{

				enquanto(opcao == 5)
				{

					carregar_tela_celular()

					topo()

					g.definir_tamanho_texto(27.0)
		
					titulo = " REMOVER ÚLTIMO LIVRO"

					carregar_titulo()

					cabecalho()
					
					se(ponteiro == 0)
					{
						mensagem1 = "            VERDADEIRO"
						mensagem2 = "  Nenhum livro encontrado"	
					}
					
					se(ponteiro > 0)
					{
						mensagem1 = "                  FALSO "
						mensagem2 = "     Existem livros na Pilha"	
					}
					alerta()
					g.renderizar()
					
				}
			}
			caso 6:
			{
				enquanto(opcao == 6)
				{
					
					carregamento_inicial = 1
					tela_carregamento()
				     g.renderizar()
				     
				}
			}
			
			caso 7:
			{
				enquanto(opcao == 7)
				{
					
					colecao_harry_potter()
				     g.renderizar()
				     
				}
			}

			caso 8:
			{
				enquanto(opcao == 8)
				{
					
					colecao_game_of_thrones()
				     g.renderizar()
				     
				}
			}			
		}
	}

	funcao tela_carregamento()
	{
		carregar_tela_celular()
		
		g.definir_cor(0x006BB7)
		g.desenhar_retangulo(22, 98, (largura_janela - 42), 550, falso, verdadeiro)
		g.desenhar_imagem(101, 200, senai_logo_carregamento)

		se(aparecer_logo < 78 )
		{
			g.definir_cor(0x006BB7)
			g.desenhar_retangulo(98, 199, 104 - aparecer_logo, 72, verdadeiro, verdadeiro)

			g.definir_cor(0x006BB7)
			g.desenhar_retangulo(200 + aparecer_logo, 199, 104 - aparecer_logo , 72, verdadeiro, verdadeiro)
			
			aparecer_logo++
			
			u.aguarde(10)
		}
		se(aparecer_logo > 75 e carregamento_inicial == 0)
		{
			g.definir_cor(g.COR_PRETO)
			g.desenhar_retangulo(60, 354, 282, 22, verdadeiro, falso)
			g.desenhar_retangulo(61, 355, 280, 20, verdadeiro, falso)
			g.desenhar_retangulo(62, 356, 278, 18, verdadeiro, falso)
			
			se(loading < 277 e carregamento_inicial == 0)
			{	
				g.definir_cor(g.COR_BRANCO)
				g.desenhar_retangulo(63, 357, loading, 16, verdadeiro, verdadeiro)
				loading++
				u.aguarde(10)
				
				
				g.definir_estilo_texto(falso,verdadeiro, falso)
				g.definir_cor(0xEDA832)
				g.definir_fonte_texto("Arial")
				g.definir_tamanho_texto(14.0)
				
				se( loading > 0 e  loading < 50)
				{
					g.desenhar_texto(60, 335, "Preparando para carregar sistema...")
					u.aguarde(30)
					
				}
				se(loading > 50 e  loading < 54)
				{
					g.desenhar_texto(60, 335, "carregar/tela_celular.png")
					u.aguarde(30)
			
				}
				se(loading > 54 e  loading < 58)
				{
					g.desenhar_texto(60, 335, "carregar/senai_logo.png")
					u.aguarde(30)
				}
				se(loading > 58 e  loading < 62)
				{
					g.desenhar_texto(60, 335, "carregar/botao_adicionar.png")
					u.aguarde(30)
				}
				se(loading > 62 e  loading < 66)
				{
					g.desenhar_texto(60, 335, "carregar/remover_ultimo_livro.png")
					u.aguarde(30)
				}
				se(loading > 66 e  loading < 70)
				{
					g.desenhar_texto(60, 335, "carregarremover_tudo.png")
					u.aguarde(30)
				}
				se(loading > 70 e  loading < 74)
				{
					g.desenhar_texto(60, 335, "carregar/pilha_livros.png")
					u.aguarde(30)
				}
				se(loading > 74 e  loading < 78)
				{
					g.desenhar_texto(60, 335, "carregar/lista_vazia.png")
					u.aguarde(30)
					
				}
				se(loading > 78 e  loading < 82)
				{
					g.desenhar_texto(60, 335, "carregar/sair_do_programa.png")
					u.aguarde(30)
				}
				se(loading > 82 e  loading < 86)
				{
					g.desenhar_texto(60, 335, "carregar/icone_alerta.png")
					u.aguarde(30)
				}
				se(loading > 86 e  loading < 90)
				{
					g.desenhar_texto(60, 335, "carregar/botao_voltar.png")
					u.aguarde(30)
					
				}
				se(loading > 90 e  loading < 94)
				{
					g.desenhar_texto(60, 335, "carregar/botao_confirmar.png")
					u.aguarde(30)
				}
				se(loading > 94 e  loading < 98)
				{
					g.desenhar_texto(60, 335, "carregar/botao_negar.png")
					u.aguarde(30)
				}
				se(loading > 98 e  loading < 102)
				{
					g.desenhar_texto(60, 335, "carregar/logo_harry_potter.png")
					u.aguarde(30)
				}
				se(loading > 102 e  loading < 106)
				{
					g.desenhar_texto(60, 335, "carregar/pedra_filosofal.png")
					u.aguarde(30)
				}
				se(loading > 106 e  loading < 110)
				{
					g.desenhar_texto(60, 335, "carregar/prisioneiro_de_azkaban.png")
					u.aguarde(30)
				}
				se(loading > 110 e  loading < 114)
				{
					g.desenhar_texto(60, 335, "carregar/camara_secreta.png")
					u.aguarde(30)
				}
				se(loading > 114 e  loading < 118)
				{
					g.desenhar_texto(60, 335, "carregar/calice_de_fogo.png")
					u.aguarde(30)
				}
				se(loading > 118 e  loading < 122)
				{
					g.desenhar_texto(60, 335, "carregar/enigma_do_principe.png")
					u.aguarde(30)
				}
				se(loading > 122 e  loading < 126)
				{
					g.desenhar_texto(60, 335, "carregar/enigma_do_principe.png")
					u.aguarde(30)
				}
				se(loading > 126 e  loading < 130)
				{
					g.desenhar_texto(60, 335, "carregar/ordem_da_fenix.png")
					u.aguarde(30)
				}
				se(loading > 130 e  loading < 134)
				{
					g.desenhar_texto(60, 335, "carregar/capa_pedra_filosofal.png")
					u.aguarde(30)
				}
				se(loading > 134 e  loading < 138)
				{
					g.desenhar_texto(60, 335, "carregar/capa_prisioneiro_de_azkaban.png")
					u.aguarde(30)
				}
				se(loading > 138 e  loading < 142)
				{
					g.desenhar_texto(60, 335, "carregar/capa_camara_secreta.png")
					u.aguarde(30)
				}
				se(loading > 142 e  loading < 146)
				{
					g.desenhar_texto(60, 335, "carregar/capa_calice_de_fogo.png")
					u.aguarde(30)
				}
				se(loading > 146 e  loading < 150)
				{
					g.desenhar_texto(60, 335, "carregar/capa_enigma_do_principe.png")
					u.aguarde(30)
				}
				se(loading > 150 e  loading < 155)
				{
					g.desenhar_texto(60, 335, "carregar/capa_ordem_da_fenix.png")
					u.aguarde(30)
				}
				se(loading > 160 e  loading < 200)
				{
					g.desenhar_texto(60, 335, "Carregando versão V.0.8.7.3 Beta")
					u.aguarde(30)
				}
				
				se(loading > 200 e  loading < 276)
				{
					g.desenhar_texto(60, 335, "Inicializando sistema...")
					u.aguarde(30)
				}
			}
			se(loading == 276)
			{
				u.aguarde(500)
				carregamento_inicial = 1
				loading = 0
				opcao = 0
				
			}
		}
		
		se(aparecer_logo > 75 e carregamento_inicial == 1)
		{
			
			g.definir_estilo_texto(verdadeiro, verdadeiro, falso)
			g.definir_cor(g.COR_BRANCO)
			g.definir_fonte_texto("Tahoma")
			g.definir_tamanho_texto(30.0)
			
			se(aux_loading >= 0 e  aux_loading <= 15)
			{
				g.desenhar_texto(120, 350, "AGUARDE")
				g.desenhar_texto(60, 390, "Estamos Finalizando")
				g.desenhar_texto(120, 420, "o sistema ")
				u.aguarde(30)
				aux_loading++
				loading++
			}
			se(aux_loading >=15  e  aux_loading <= 30)
			{
				g.desenhar_texto(120, 350, "AGUARDE")
				g.desenhar_texto(60, 390, "Estamos Finalizando")
				g.desenhar_texto(120, 420, "o sistema. ")
				u.aguarde(30)
				aux_loading++
				loading++
			}
			se(aux_loading >= 30 e  aux_loading <= 45)
			{
				
				g.desenhar_texto(120, 350, "AGUARDE")
				g.desenhar_texto(60, 390, "Estamos Finalizando")
				g.desenhar_texto(120, 420, "o sistema..")
				u.aguarde(30)
				aux_loading++
				loading++
			}
			se(aux_loading >= 45 e  aux_loading <= 60)
			{
				
				g.desenhar_texto(120, 350, "AGUARDE")
				g.desenhar_texto(60, 390, "Estamos Finalizando")
				g.desenhar_texto(120, 420, "o sistema...")
				u.aguarde(30)
				aux_loading++
				loading++
			}
			se(aux_loading == 60)
			{
				aux_loading = 0
			}
				
			se(loading > 180)
			{
				opcao = 10
			}
		}
	}
	
	funcao menu()
	{
		
		carregar_tela_celular()

		topo()
		
		g.definir_tamanho_texto(27.0)
		
		titulo = "  BIBLIOTECA DE LIVROS"

		carregar_titulo()

		cabecalho()

		g.definir_estilo_texto(falso,verdadeiro, falso)
		g.definir_cor(g.COR_PRETO)
		g.definir_fonte_texto("Arial")
		g.definir_tamanho_texto(fonte_padrao)
		
		//colocando contorno cinza em volta da opção quando o mouse passar sobre a area demarcada
		se(m.posicao_x() >= 22 e m.posicao_x() <= 380 e m.posicao_y() >= 210 e m.posicao_y() <= 270)
		{
			g.definir_cor(0xdfdfdf)
			g.desenhar_retangulo(22, 210, (largura_janela - 42), 60, falso, verdadeiro)		
		}
		senao se(m.posicao_x() >= 22 e m.posicao_x() <= 380 e m.posicao_y() >= 270 e m.posicao_y() <= 330)
		{
			g.definir_cor(0xdfdfdf)
			g.desenhar_retangulo(22, 270, (largura_janela - 42), 60, verdadeiro, verdadeiro)	
		}
		senao se(m.posicao_x() >= 22 e m.posicao_x() <= 380 e m.posicao_y() >= 330 e m.posicao_y() <= 390)
		{
			g.definir_cor(0xdfdfdf)
			g.desenhar_retangulo(22, 330, (largura_janela - 42), 60, verdadeiro, verdadeiro)	
		}
		senao se(m.posicao_x() >= 22 e m.posicao_x() <= 380 e m.posicao_y() >= 390 e m.posicao_y() <= 450)
		{
			g.definir_cor(0xdfdfdf)
			g.desenhar_retangulo(22, 390, (largura_janela - 42), 60, verdadeiro, verdadeiro)	
		}
		senao se(m.posicao_x() >= 22 e m.posicao_x() <= 380 e m.posicao_y() >= 450 e m.posicao_y() <= 510)
		{
			g.definir_cor(0xdfdfdf)
			g.desenhar_retangulo(22, 450, (largura_janela - 42), 60, verdadeiro, verdadeiro)	
		}
		senao se(m.posicao_x() >= 22 e m.posicao_x() <= 380 e m.posicao_y() >= 510 e m.posicao_y() <= 570)
		{
			g.definir_cor(0xdfdfdf)
			g.desenhar_retangulo(22, 510, (largura_janela - 42), 60, verdadeiro, verdadeiro)	
		}

		//Adicionando os ícones do menu principal
		g.desenhar_imagem(25, 220, botao_adicionar)
		g.desenhar_imagem(25, 280, remover_ultimo_livro)
		g.desenhar_imagem(25, 340, remover_tudo)
		g.desenhar_imagem(25, 400, pilha_livros)
		g.desenhar_imagem(25, 460, lista_vazia)
		g.desenhar_imagem(25, 520, sair_do_programa)

		//Definindo estilo, tamanho e cor da fonte que será colocada na frente dos ícones do menu principal
		g.definir_estilo_texto(falso,verdadeiro, falso)
		g.definir_cor(g.COR_PRETO)
		g.definir_tamanho_texto(fonte_padrao)
		
		//Colocando o texto em frente aos ícones no menu principal
		g.desenhar_texto(75, 530, "Sair do Programa")
		g.desenhar_texto(75, 230, "Adicionar livro à Pilha")
		g.desenhar_texto(75, 290, "Remover último livro")
		g.desenhar_texto(75, 350, "Remover todos os livros")
		g.desenhar_texto(75, 410, "Mostrar livros Empilhados")
		g.desenhar_texto(75, 470, "Verificar se a Pilha está vazia")
		g.desenhar_texto(75, 530, "Sair do Programa")

		 se(m.botao_pressionado(m.BOTAO_ESQUERDO))
			{	
		          se(m.posicao_x() >= 22 e m.posicao_x() <= 380 e m.posicao_y() >= 210 e m.posicao_y() <= 270)
				{
					u.aguarde(100)
					opcao = 1
				}

				se(m.posicao_x() >= 22 e m.posicao_x() <= 380 e m.posicao_y() >= 270 e m.posicao_y() <= 330)
				{
					u.aguarde(100)
					opcao = 2
				}

				se(m.posicao_x() >= 22 e m.posicao_x() <= 380 e m.posicao_y() >= 330 e m.posicao_y() <= 390)
				{
					u.aguarde(100)
					opcao = 3
				}

				se(m.posicao_x() >= 22 e m.posicao_x() <= 380 e m.posicao_y() >= 390 e m.posicao_y() <= 450)
				{
					u.aguarde(100)
					opcao = 4
				}

				se(m.posicao_x() >= 22 e m.posicao_x() <= 380 e m.posicao_y() >= 450 e m.posicao_y() <= 510)
				{
					u.aguarde(100)
					opcao = 5
				}

				se(m.posicao_x() >= 22 e m.posicao_x() <= 380 e m.posicao_y() >= 510 e m.posicao_y() <= 570)
				{
					u.aguarde(100)
					opcao = 6
				}
			}									  					
	}
	
	funcao empilhar() //Função para fazer o cadastramentos dos elementos que serão empilhados.
	{	
		carregar_tela_celular()

		topo()

		g.definir_tamanho_texto(27.0)
		
		titulo = "   COLEÇÕES DE LIVROS"

		carregar_titulo()

		cabecalho()

		g.definir_cor(0xE09553)
		g.desenhar_retangulo(22, 210, 358, 50, verdadeiro, verdadeiro)
		
		g.definir_cor(g.COR_PRETO)
		g.desenhar_retangulo(22, 210, 358, 50, verdadeiro, falso)
		
		g.desenhar_imagem(101, 215, logo_harry_potter)
		

		se(m.posicao_x() >= 22 e m.posicao_x() <= 380 e m.posicao_y() >= 210 e m.posicao_y() <= 260)
		{
			g.definir_cor(0xC38248)
			g.desenhar_retangulo(22, 210, 358, 50, verdadeiro, verdadeiro)
		
			g.definir_cor(g.COR_PRETO)
			g.desenhar_retangulo(22, 210, 358, 50, verdadeiro, falso)
		
			g.desenhar_imagem(101, 215, logo_harry_potter)
	 
		}

		g.definir_cor(0x65DEEB)
		g.desenhar_retangulo(22, 260, 358, 50, verdadeiro, verdadeiro)
		
		g.definir_cor(g.COR_PRETO)
		g.desenhar_retangulo(22, 260, 358, 50, verdadeiro, falso)
		
		g.desenhar_imagem(101, 265, logo_game_of_thrones)
		

		se(m.posicao_x() >= 22 e m.posicao_x() <= 380 e m.posicao_y() >= 260 e m.posicao_y() <= 310)
		{
			g.definir_cor(0x58C2CD)
			g.desenhar_retangulo(22, 260, 358, 50, verdadeiro, verdadeiro)
		
			g.definir_cor(g.COR_PRETO)
			g.desenhar_retangulo(22, 260, 358, 50, verdadeiro, falso)
		
			g.desenhar_imagem(101, 265, logo_game_of_thrones)
	 
		}
		
		se(m.botao_pressionado(m.BOTAO_ESQUERDO) e m.posicao_x() >= 22 e m.posicao_x() <= 380 e m.posicao_y() >= 210 e m.posicao_y() <= 260)
		{
			se(m.ler_botao() == m.BOTAO_ESQUERDO)
			{
				u.aguarde(100)
				opcao = 7
				inicio()
			}
		}
		se(m.botao_pressionado(m.BOTAO_ESQUERDO) e m.posicao_x() >= 22 e m.posicao_x() <= 380 e m.posicao_y() >= 260 e m.posicao_y() <= 310)
		{
			se(m.ler_botao() == m.BOTAO_ESQUERDO)
			{
				u.aguarde(100)
				opcao = 8
				inicio()
			}
		}
		
		se(t.tecla_pressionada(t.TECLA_ESC))
		{
			u.aguarde(300)
			opcao = 0
			inicio()
		}
	
	}

	funcao colecao_harry_potter()
	{
		carregar_tela_celular()

		g.definir_cor(0xE1BF41)
		g.desenhar_retangulo(22, 210, (largura_janela - 42), 438, falso, verdadeiro)
		

		topo()

		g.definir_tamanho_texto(26.0)
		
		titulo = " COLEÇÃO HARRY POTTER"

		carregar_titulo()

		cabecalho()

		g.desenhar_imagem(34, 220, pedra_filosofal)
		g.desenhar_imagem(151, 220, prisioneiro_de_azkaban)
		g.desenhar_imagem(268, 220, camara_secreta)
		g.desenhar_imagem(34, 380, calice_de_fogo)
		g.desenhar_imagem(151, 380, enigma_do_principe)
		g.desenhar_imagem(268, 380, ordem_da_fenix)
		
		

		se(nao m.botao_pressionado(m.BOTAO_ESQUERDO) e m.posicao_x() >= 34 e m.posicao_x() <= 134 e m.posicao_y() >= 220 e m.posicao_y() <= 370)
		{
			g.desenhar_imagem(31, 217, pedra_filosofal)	
		}
		
		se(m.botao_pressionado(m.BOTAO_ESQUERDO) e m.posicao_x() >= 34 e m.posicao_x() <= 134 e m.posicao_y() >= 220 e m.posicao_y() <= 370)
		{
			se(m.ler_botao() == m.BOTAO_ESQUERDO)
			{
				se(ponteiro < total)
				{
					se(voltar == 0)
					{
						confirmar_livro()
					}
					se(voltar == 1)
					{
						livros[ponteiro] = capa_pedra_filosofal
						nome_livros[ponteiro] = "Harry Potter-Pedra Filosofal"
						ponteiro++
						u.aguarde(500)
					}	
				}
			}
		}
			
		se(m.posicao_x() >= 151 e m.posicao_x() <= 251 e m.posicao_y() >= 220 e m.posicao_y() <= 370)
		{
			g.desenhar_imagem(148, 217, prisioneiro_de_azkaban)
		}
		
		se(m.botao_pressionado(m.BOTAO_ESQUERDO) e m.posicao_x() >= 151 e m.posicao_x() <= 251 e m.posicao_y() >= 220 e m.posicao_y() <= 370)
		{
			se(m.ler_botao() == m.BOTAO_ESQUERDO)
			{
				se(ponteiro < total)
				{
					se(voltar == 0)
					{
						confirmar_livro()
					}
					se(voltar == 1)
					{
						livros[ponteiro] = capa_prisioneiro_de_azkaban
						nome_livros[ponteiro] = "Harry Potter-Prisioneiro de Azkaban"
						ponteiro++
						u.aguarde(500)
					}
				}
			}				
		}
		se(m.posicao_x() >= 268 e m.posicao_x() <= 368 e m.posicao_y() >= 220 e m.posicao_y() <= 370)
		{			
			g.desenhar_imagem(265, 217, camara_secreta)
		}
		
		se(m.botao_pressionado(m.BOTAO_ESQUERDO) e m.posicao_x() >= 268 e m.posicao_x() <= 368 e m.posicao_y() >= 220 e m.posicao_y() <= 370)
		{
			se(m.ler_botao() == m.BOTAO_ESQUERDO)
			{
				se(ponteiro < total)
				{
					se(voltar == 0)
					{
						confirmar_livro()
					}
					se(voltar == 1)
					{
						livros[ponteiro] = capa_camara_secreta
						nome_livros[ponteiro] = "Harry Potter-Camara Secreta"
						ponteiro++
						u.aguarde(500)
					}
				}
			}		
		}
		
		se(m.posicao_x() >= 34 e m.posicao_x() <= 134 e m.posicao_y() >= 380 e m.posicao_y() <= 530)
		{
			g.desenhar_imagem(31, 377, calice_de_fogo)
		}
		
		se(m.botao_pressionado(m.BOTAO_ESQUERDO) e m.posicao_x() >= 34 e m.posicao_x() <= 134 e m.posicao_y() >= 380 e m.posicao_y() <= 530)
		{
			se(m.ler_botao() == m.BOTAO_ESQUERDO)
			{
				se(ponteiro < total)
				{
					se(voltar == 0)
					{
						confirmar_livro()
					}
					se(voltar == 1)
					{						
						livros[ponteiro] = capa_calice_de_fogo
						nome_livros[ponteiro] = "Harry Potter-Calice de Fogo"
						ponteiro++
						u.aguarde(500)						
					}
				}
			}	
		}
		
		se(m.posicao_x() >= 151 e m.posicao_x() <= 251 e m.posicao_y() >= 380 e m.posicao_y() <= 530)
		{			
			g.desenhar_imagem(148, 377, enigma_do_principe)			
		}
		se(m.botao_pressionado(m.BOTAO_ESQUERDO) e m.posicao_x() >= 151 e m.posicao_x() <= 251 e m.posicao_y() >= 380 e m.posicao_y() <= 530)
		{			
			se(m.ler_botao() == m.BOTAO_ESQUERDO)
			{				
				se(ponteiro < total)
				{					
					se(voltar == 0)
					{						
						confirmar_livro()
						
					}
					se(voltar == 1)
					{						
						livros[ponteiro] = capa_enigma_do_principe
						nome_livros[ponteiro] = "Harry Potter-Enigma do Principe"
						ponteiro++
						u.aguarde(500)						
					}
				}
			}	
		}
		
		se(nao m.botao_pressionado(m.BOTAO_ESQUERDO) e m.posicao_x() >= 268 e m.posicao_x() <= 368 e m.posicao_y() >= 380 e m.posicao_y() <= 530)
		{			
			g.desenhar_imagem(265, 377, ordem_da_fenix)			
		}
		
		se(m.botao_pressionado(m.BOTAO_ESQUERDO) e m.posicao_x() >= 268 e m.posicao_x() <= 368 e m.posicao_y() >= 380 e m.posicao_y() <= 530)
		{			
			se(m.ler_botao() == m.BOTAO_ESQUERDO)
			{				
				se(ponteiro < total)
				{				
					se(voltar == 0)
					{						
						confirmar_livro()
					}
					se(voltar == 1)
					{
						livros[ponteiro] = capa_ordem_da_fenix
						nome_livros[ponteiro] = "Harry Potter-Ordem da Fenix"
						ponteiro++
						u.aguarde(500)	
					}
				}
			}		
		}
		
		se(t.tecla_pressionada(t.TECLA_ESC))
		{
			
			u.aguarde(300)
			opcao = 1
			inicio()
			
		}
		
		voltar = 0
	}

	funcao colecao_game_of_thrones()
	{
		carregar_tela_celular()

		g.definir_cor(0x65DEEB)
		g.desenhar_retangulo(22, 210, (largura_janela - 42), 438, falso, verdadeiro)
		

		topo()

		g.definir_tamanho_texto(24.5)
		g.definir_fonte_texto("Tahoma")
		g.definir_estilo_texto(falso, falso, falso)
		titulo = "COLEÇÃO GAME OF THRONES"

		carregar_titulo()

		cabecalho()

		g.desenhar_imagem(34, 220, game_of_thrones)
		g.desenhar_imagem(151, 220, clash_of_kings)
		g.desenhar_imagem(268, 220, storm_of_swords)
		g.desenhar_imagem(34, 380, feast_for_crows)
		g.desenhar_imagem(151, 380, dance_with_dragons)
		
		se(nao m.botao_pressionado(m.BOTAO_ESQUERDO) e m.posicao_x() >= 34 e m.posicao_x() <= 134 e m.posicao_y() >= 220 e m.posicao_y() <= 370)
		{
			g.desenhar_imagem(31, 217, game_of_thrones)	
		}
		
		se(m.botao_pressionado(m.BOTAO_ESQUERDO) e m.posicao_x() >= 34 e m.posicao_x() <= 134 e m.posicao_y() >= 220 e m.posicao_y() <= 370)
		{
			se(m.ler_botao() == m.BOTAO_ESQUERDO)
			{
				se(ponteiro < total)
				{
					se(voltar == 0)
					{
						confirmar_livro()
					}
					se(voltar == 1)
					{
						livros[ponteiro] = capa_game_of_thrones
						nome_livros[ponteiro] = "GOT- A Game Of Thrones"
						ponteiro++
						u.aguarde(500)
					}	
				}
			}
		}
			
		se(m.posicao_x() >= 151 e m.posicao_x() <= 251 e m.posicao_y() >= 220 e m.posicao_y() <= 370)
		{
			g.desenhar_imagem(148, 217, clash_of_kings)
		}
		
		se(m.botao_pressionado(m.BOTAO_ESQUERDO) e m.posicao_x() >= 151 e m.posicao_x() <= 251 e m.posicao_y() >= 220 e m.posicao_y() <= 370)
		{
			se(m.ler_botao() == m.BOTAO_ESQUERDO)
			{
				se(ponteiro < total)
				{
					se(voltar == 0)
					{
						confirmar_livro()
					}
					se(voltar == 1)
					{
						livros[ponteiro] = capa_clash_of_kings
						nome_livros[ponteiro] = "GOT- A Clash Of Kings"
						ponteiro++
						u.aguarde(500)
					}
				}
			}				
		}
		se(m.posicao_x() >= 268 e m.posicao_x() <= 368 e m.posicao_y() >= 220 e m.posicao_y() <= 370)
		{			
			g.desenhar_imagem(265, 217, storm_of_swords)
		}
		
		se(m.botao_pressionado(m.BOTAO_ESQUERDO) e m.posicao_x() >= 268 e m.posicao_x() <= 368 e m.posicao_y() >= 220 e m.posicao_y() <= 370)
		{
			se(m.ler_botao() == m.BOTAO_ESQUERDO)
			{
				se(ponteiro < total)
				{
					se(voltar == 0)
					{
						confirmar_livro()
					}
					se(voltar == 1)
					{
						livros[ponteiro] = capa_storm_of_swords
						nome_livros[ponteiro] = "GOT- A Storm Of Swords"
						ponteiro++
						u.aguarde(500)
					}
				}
			}		
		}
		
		se(m.posicao_x() >= 34 e m.posicao_x() <= 134 e m.posicao_y() >= 380 e m.posicao_y() <= 530)
		{
			g.desenhar_imagem(31, 377, feast_for_crows)
		}
		
		se(m.botao_pressionado(m.BOTAO_ESQUERDO) e m.posicao_x() >= 34 e m.posicao_x() <= 134 e m.posicao_y() >= 380 e m.posicao_y() <= 530)
		{
			se(m.ler_botao() == m.BOTAO_ESQUERDO)
			{
				se(ponteiro < total)
				{
					se(voltar == 0)
					{
						confirmar_livro()
					}
					se(voltar == 1)
					{						
						livros[ponteiro] = capa_feast_for_crows
						nome_livros[ponteiro] = "GOT- A Feast For Crows"
						ponteiro++
						u.aguarde(500)						
					}
				}
			}	
		}
		
		se(m.posicao_x() >= 151 e m.posicao_x() <= 251 e m.posicao_y() >= 380 e m.posicao_y() <= 530)
		{			
			g.desenhar_imagem(148, 377, dance_with_dragons)			
		}
		se(m.botao_pressionado(m.BOTAO_ESQUERDO) e m.posicao_x() >= 151 e m.posicao_x() <= 251 e m.posicao_y() >= 380 e m.posicao_y() <= 530)
		{			
			se(m.ler_botao() == m.BOTAO_ESQUERDO)
			{				
				se(ponteiro < total)
				{					
					se(voltar == 0)
					{						
						confirmar_livro()
						
					}
					se(voltar == 1)
					{						
						livros[ponteiro] = capa_dance_with_dragons
						nome_livros[ponteiro] = "GOT- A Dance With Dragons"
						ponteiro++
						u.aguarde(500)						
					}
				}
			}	
		}
		
		se(t.tecla_pressionada(t.TECLA_ESC))
		{
			
			u.aguarde(300)
			opcao = 1
			inicio()
			
		}
		
		voltar = 0
	}

	funcao desempilhar()
	{
		
		carregar_tela_celular()

		topo()

		g.definir_tamanho_texto(27.0)
		
		titulo = " REMOVER ÚLTIMO LIVRO"

		carregar_titulo()
		
		cabecalho()

		se(ponteiro == 0)
		{
			
			mensagem1 = "Não foi encontrado nenhum"
			mensagem2 = "             livro na Pilha!"
			alerta()
			
		}

		g.definir_cor(g.COR_PRETO)
		g.desenhar_retangulo(100, 250, 200, 120, verdadeiro, falso)
		
		g.definir_cor(0xdfdfdf)
		g.desenhar_retangulo(101, 251, 198, 118, verdadeiro, verdadeiro)
		
		g.desenhar_imagem(170, 260, icone_alerta)

		g.definir_cor(g.COR_PRETO)

		g.definir_estilo_texto(falso,verdadeiro, falso)
		g.definir_tamanho_texto(22.0)
		
		g.desenhar_texto(150, 335, "ALERTA!!!")
		
		g.definir_tamanho_texto(26.0)
		
		se(ponteiro > 0)
		{
			g.desenhar_texto(40, 400, "   Gostaria de retirar o")
			g.desenhar_texto(40, 425, "   último livro da pilha?")
			
			g.definir_estilo_texto(falso,verdadeiro, falso)
			g.definir_tamanho_texto(20.0)
			
			g.desenhar_imagem(151, 460, livros[ponteiro -1])
			g.desenhar_texto(30 , 490, nome_livros[ponteiro - 1])

			

			g.definir_cor(g.COR_VERDE)
			g.desenhar_retangulo(50, 550, 152, 50, falso, verdadeiro)

			g.definir_cor(g.COR_PRETO)
			g.desenhar_retangulo(50, 550, 152, 50, falso, falso)
			
			g.definir_cor(g.COR_VERMELHO)
			g.desenhar_retangulo(202, 550, 152, 50, falso, verdadeiro)

			g.definir_cor(g.COR_PRETO)
			g.desenhar_retangulo(202, 550, 152, 50, falso, falso)
			
			g.desenhar_imagem(100, 555, botao_confirmar)
			g.desenhar_imagem(264, 555, botao_negar)

			g.definir_estilo_texto(verdadeiro, verdadeiro, falso)
			g.definir_tamanho_texto(32.0)

			se(m.posicao_x() >= 50 e m.posicao_x() <= 202 e m.posicao_y() >= 550 e m.posicao_y() <= 600)
			{
				
				g.definir_cor(g.COR_VERDE)
				g.desenhar_retangulo(47, 547, 152, 50, falso, verdadeiro)

				g.definir_cor(g.COR_PRETO)
				g.desenhar_retangulo(47, 547, 152, 50, falso, falso)

				g.desenhar_imagem(100, 555, botao_confirmar)

			}
			se(m.botao_pressionado(m.BOTAO_ESQUERDO) e m.posicao_x() >= 50 e m.posicao_x() <= 202 e m.posicao_y() >= 550 e m.posicao_y() <= 600)
			{
				u.aguarde(100)
				opcao = 0
				ponteiro--
				inicio()
				
			}
			
			se(m.posicao_x() >= 202 e m.posicao_x() <= 354 e m.posicao_y() >= 550 e m.posicao_y() <= 600)
			{

				g.definir_cor(g.COR_VERMELHO)
				g.desenhar_retangulo(199, 547, 152, 50, falso, verdadeiro)

				g.definir_cor(g.COR_PRETO)
				g.desenhar_retangulo(199, 547, 152, 50, falso, falso)

				g.desenhar_imagem(264, 555, botao_negar)

			}
		
			se(m.botao_pressionado(m.BOTAO_ESQUERDO) e m.posicao_x() >= 202 e m.posicao_x() <= 354 e m.posicao_y() >= 550 e m.posicao_y() <= 600)
			{
				u.aguarde(100)
				opcao = 0
				inicio()
				
			}
		}
	}

	funcao remover_todos_livros()
	{
		carregar_tela_celular()

		topo()

		g.definir_tamanho_texto(27.0)
		
		titulo = " REMOVER ÚLTIMO LIVRO"

		carregar_titulo()

		cabecalho()

		se(ponteiro == 0)
		{
			
			mensagem1 = "Não foi encontrado nenhum"
			mensagem2 = "             livro na Pilha!"
			alerta()
			
		}

		g.definir_cor(g.COR_PRETO)
		g.desenhar_retangulo(100, 250, 200, 120, verdadeiro, falso)
		
		g.definir_cor(0xdfdfdf)
		g.desenhar_retangulo(101, 251, 198, 118, verdadeiro, verdadeiro)
		
		g.desenhar_imagem(170, 260, icone_alerta)

		g.definir_cor(g.COR_PRETO)

		g.definir_estilo_texto(falso,verdadeiro, falso)
		g.definir_tamanho_texto(22.0)
		
		g.desenhar_texto(150, 335, "ALERTA!!!")
		
		g.definir_tamanho_texto(26.0)
		
		se(ponteiro > 0)
		{
			g.desenhar_texto(40, 400, "    Gostaria de remover ")
			g.desenhar_texto(40, 425, "todos os livros da pilha?")

			g.definir_cor(g.COR_VERDE)
			g.desenhar_retangulo(50, 550, 152, 50, falso, verdadeiro)

			g.definir_cor(g.COR_PRETO)
			g.desenhar_retangulo(50, 550, 152, 50, falso, falso)
			
			g.definir_cor(g.COR_VERMELHO)
			g.desenhar_retangulo(202, 550, 152, 50, falso, verdadeiro)

			g.definir_cor(g.COR_PRETO)
			g.desenhar_retangulo(202, 550, 152, 50, falso, falso)
			
			g.desenhar_imagem(100, 555, botao_confirmar)
			g.desenhar_imagem(264, 555, botao_negar)

			g.definir_estilo_texto(verdadeiro, verdadeiro, falso)
			g.definir_tamanho_texto(32.0)

			se(m.posicao_x() >= 50 e m.posicao_x() <= 202 e m.posicao_y() >= 550 e m.posicao_y() <= 600)
			{
				
				g.definir_cor(g.COR_VERDE)
				g.desenhar_retangulo(47, 547, 152, 50, falso, verdadeiro)

				g.definir_cor(g.COR_PRETO)
				g.desenhar_retangulo(47, 547, 152, 50, falso, falso)

				g.desenhar_imagem(100, 555, botao_confirmar)				

			}
			se(m.botao_pressionado(m.BOTAO_ESQUERDO) e m.posicao_x() >= 50 e m.posicao_x() <= 202 e m.posicao_y() >= 550 e m.posicao_y() <= 600)
			{
				
				u.aguarde(100)
				opcao = 0
				ponteiro = 0
				inicio()
				
			}
			
			se(m.posicao_x() >= 202 e m.posicao_x() <= 354 e m.posicao_y() >= 550 e m.posicao_y() <= 600)
			{

				g.definir_cor(g.COR_VERMELHO)
				g.desenhar_retangulo(199, 547, 152, 50, falso, verdadeiro)

				g.definir_cor(g.COR_PRETO)
				g.desenhar_retangulo(199, 547, 152, 50, falso, falso)

				g.desenhar_imagem(264, 555, botao_negar)

			}
		
			se(m.botao_pressionado(m.BOTAO_ESQUERDO) e m.posicao_x() >= 202 e m.posicao_x() <= 354 e m.posicao_y() >= 420 e m.posicao_y() <= 470)
			{
				
				u.aguarde(100)
				opcao = 0
				
			}
		}
	}

	funcao listar_pilha()
	{
		carregar_tela_celular()
		
		topo()

		g.definir_tamanho_texto(27.0)
		
		titulo = "       LIVROS NA PILHA"

		carregar_titulo()

		cabecalho()

		se(ponteiro == 0)
		{
			
			mensagem1 = "Não foi encontrado nenhum"
			mensagem2 = "             livro na Pilha!"
			alerta()
			
		}

		g.definir_cor(g.COR_PRETO)
		g.definir_estilo_texto(verdadeiro, falso, falso)
		g.definir_tamanho_texto(12.0)
		
		para(inteiro i = 0; i < ponteiro; i++)
		{
			g.desenhar_imagem(50, 570 - (18 * i), livros[i])
			g.desenhar_texto(174, 573 - (18 * i), nome_livros[i])
			
		}
		
		se(t.tecla_pressionada(t.TECLA_ESC))
		{
			u.aguarde(300)
			opcao = 0
			inicio()
		}
	}
	
	funcao confirmar_livro()
	{
		
		enquanto(voltar == 0)
		{
			se(opcao == 7)
			{
				carregar_tela_celular()

				g.definir_cor(0xE1BF41)
				g.desenhar_retangulo(22, 210, (largura_janela - 42), 438, falso, verdadeiro)
				g.desenhar_imagem(22, 210, fundo_harry_potter)
		
				topo()
		
				g.definir_tamanho_texto(26.0)
				
				titulo = " COLEÇÃO HARRY POTTER"
		
				carregar_titulo()
		
				cabecalho()
		
				g.desenhar_imagem(34, 220, pedra_filosofal)
				g.desenhar_imagem(151, 220, prisioneiro_de_azkaban)
				g.desenhar_imagem(268, 220, camara_secreta)
				g.desenhar_imagem(34, 380, calice_de_fogo)
				g.desenhar_imagem(151, 380, enigma_do_principe)
				g.desenhar_imagem(268, 380, ordem_da_fenix)
			}

			se(opcao == 8)
			{
				carregar_tela_celular()

				g.definir_cor(0x65DEEB)
				g.desenhar_retangulo(22, 210, (largura_janela - 42), 438, falso, verdadeiro)
				g.desenhar_imagem(22, 210, fundo_game_of_thrones)
		
				topo()
		
				g.definir_tamanho_texto(26.0)
				
				titulo = " COLEÇÃO HARRY POTTER"
		
				carregar_titulo()
		
				cabecalho()
		
				g.desenhar_imagem(34, 220, game_of_thrones)
				g.desenhar_imagem(151, 220, clash_of_kings)
				g.desenhar_imagem(268, 220, storm_of_swords)
				g.desenhar_imagem(34, 380, feast_for_crows)
				g.desenhar_imagem(151, 380, dance_with_dragons)
			}
			
			g.definir_cor(0xdfdfdf)
			g.desenhar_retangulo(50, 240, 304, 230, falso, verdadeiro)

			g.definir_cor(g.COR_PRETO)
			g.desenhar_retangulo(50, 240, 304, 230, falso, falso)

			g.desenhar_imagem(170, 250, icone_alerta)

			g.definir_cor(g.COR_VERDE)
			g.desenhar_retangulo(50, 420, 152, 50, falso, verdadeiro)

			g.definir_cor(g.COR_PRETO)
			g.desenhar_retangulo(50, 420, 152, 50, falso, falso)
			
			g.definir_cor(g.COR_VERMELHO)
			g.desenhar_retangulo(202, 420, 152, 50, falso, verdadeiro)

			g.definir_cor(g.COR_PRETO)
			g.desenhar_retangulo(202, 420, 152, 50, falso, falso)
			
			g.desenhar_imagem(100, 425, botao_confirmar)
			g.desenhar_imagem(264, 425, botao_negar)

			g.definir_estilo_texto(verdadeiro, verdadeiro, falso)
			g.definir_tamanho_texto(32.0)

			g.desenhar_texto(70, 320, "Deseja adicionar")
			g.desenhar_texto(70, 360, "o livro na pilha?")

			se(m.posicao_x() >= 50 e m.posicao_x() <= 202 e m.posicao_y() >= 420 e m.posicao_y() <= 470)
			{
				
				g.definir_cor(g.COR_VERDE)
				g.desenhar_retangulo(47, 417, 152, 50, falso, verdadeiro)

				g.definir_cor(g.COR_PRETO)
				g.desenhar_retangulo(47, 417, 152, 50, falso, falso)

				g.desenhar_imagem(100, 425, botao_confirmar)				

			}
			se(m.botao_pressionado(m.BOTAO_ESQUERDO) e m.posicao_x() >= 50 e m.posicao_x() <= 202 e m.posicao_y() >= 420 e m.posicao_y() <= 470)
			{
				
				voltar = 1
				
			}
			
			se(m.posicao_x() >= 202 e m.posicao_x() <= 354 e m.posicao_y() >= 420 e m.posicao_y() <= 470)
			{

				g.definir_cor(g.COR_VERMELHO)
				g.desenhar_retangulo(199, 417, 152, 50, falso, verdadeiro)

				g.definir_cor(g.COR_PRETO)
				g.desenhar_retangulo(199, 417, 152, 50, falso, falso)

				g.desenhar_imagem(264, 425, botao_negar)

			}
		
			se(m.botao_pressionado(m.BOTAO_ESQUERDO) e m.posicao_x() >= 202 e m.posicao_x() <= 354 e m.posicao_y() >= 420 e m.posicao_y() <= 470)
			{
				
				voltar = 2
				
			}
			
			g.renderizar()
			
			u.aguarde(5)
		}
	}

	funcao alerta()
	{
	
		g.definir_cor(g.COR_PRETO)
		g.desenhar_retangulo(100, 250, 200, 120, verdadeiro, falso)
		
		g.definir_cor(0xdfdfdf)
		g.desenhar_retangulo(101, 251, 198, 118, verdadeiro, verdadeiro)
		
		g.desenhar_imagem(170, 260, icone_alerta)

		g.definir_cor(g.COR_PRETO)

		g.definir_estilo_texto(falso,verdadeiro, falso)
		g.definir_tamanho_texto(22.0)
		
		g.desenhar_texto(150, 335, "ALERTA!!!")
		
		g.definir_tamanho_texto(26.0)
		
		g.desenhar_texto(30, 400, mensagem1)
		g.desenhar_texto(30, 425, mensagem2)
		
		/*se(ponteiro > 0)
		{
			g.definir_estilo_texto(falso,verdadeiro, falso)
			g.definir_tamanho_texto(20.0)
			
			g.desenhar_imagem(151, 460, livros[ponteiro -1])
			g.desenhar_texto(30, 480, nome_livros[ponteiro - 1])

		}*/
		
		se(t.tecla_pressionada(t.TECLA_ESC))
		{
			u.aguarde(300)
			opcao = 0
			inicio()
		}	
	}

	funcao carregar_imagens()
	{
		
		temp_img = g.carregar_imagem("imagem/tela_celular.png")
		tela_celular = g.redimensionar_imagem(temp_img, largura_janela, altura_janela, verdadeiro)
		g.liberar_imagem(temp_img)

		temp_img = g.carregar_imagem("imagem/senai_logo.png")
		senai_logo = g.redimensionar_imagem(temp_img, 155 , 40, verdadeiro)
		g.liberar_imagem(temp_img)

		temp_img = g.carregar_imagem("imagem/botao_adicionar.png")
		botao_adicionar = g.redimensionar_imagem(temp_img, 40, 40, verdadeiro)
		g.liberar_imagem(temp_img)

		temp_img = g.carregar_imagem("imagem/remover_ultimo_livro.png")
		remover_ultimo_livro = g.redimensionar_imagem(temp_img, 40 , 40, verdadeiro)
		g.liberar_imagem(temp_img)

		temp_img = g.carregar_imagem("imagem/remover_tudo.png")
		remover_tudo = g.redimensionar_imagem(temp_img, 40 , 40, verdadeiro)
		g.liberar_imagem(temp_img)

		temp_img = g.carregar_imagem("imagem/pilha_livros.png")
		pilha_livros = g.redimensionar_imagem(temp_img, 40 , 40, verdadeiro)
		g.liberar_imagem(temp_img)

		temp_img = g.carregar_imagem("imagem/lista_vazia.png")
		lista_vazia = g.redimensionar_imagem(temp_img, 40 , 40, verdadeiro)
		g.liberar_imagem(temp_img)

		temp_img = g.carregar_imagem("imagem/sair_do_programa.png")
		sair_do_programa = g.redimensionar_imagem(temp_img, 40 , 40, verdadeiro)
		g.liberar_imagem(temp_img)

		temp_img = g.carregar_imagem("imagem/icone_alerta.png")
		icone_alerta = g.redimensionar_imagem(temp_img, 60 , 60, verdadeiro)
		g.liberar_imagem(temp_img)

		temp_img = g.carregar_imagem("imagem/botao_voltar.png")
		botao_voltar = g.redimensionar_imagem(temp_img, 50 , 40, verdadeiro)
		g.liberar_imagem(temp_img)

		temp_img = g.carregar_imagem("imagem/botao_confirmar.png")
		botao_confirmar = g.redimensionar_imagem(temp_img, 40 , 40, verdadeiro)
		g.liberar_imagem(temp_img)
		
		temp_img = g.carregar_imagem("imagem/botao_negar.png")
		botao_negar = g.redimensionar_imagem(temp_img, 40 , 40, verdadeiro)
		g.liberar_imagem(temp_img)

		temp_img = g.carregar_imagem("imagem/harry_potter/logo_harry_potter.png")
		logo_harry_potter = g.redimensionar_imagem(temp_img, 200 , 40, verdadeiro)
		g.liberar_imagem(temp_img)
		
		temp_img = g.carregar_imagem("imagem/harry_potter/pedra_filosofal.png")
		pedra_filosofal = g.redimensionar_imagem(temp_img, 100 , 150, verdadeiro)
		g.liberar_imagem(temp_img)

		temp_img = g.carregar_imagem("imagem/harry_potter/prisioneiro_de_azkaban.png")
		prisioneiro_de_azkaban = g.redimensionar_imagem(temp_img, 100 , 150, verdadeiro)
		g.liberar_imagem(temp_img)

		temp_img = g.carregar_imagem("imagem/harry_potter/camara_secreta.png")
		camara_secreta = g.redimensionar_imagem(temp_img, 100 , 150, verdadeiro)
		g.liberar_imagem(temp_img)

		temp_img = g.carregar_imagem("imagem/harry_potter/calice_de_fogo.png")
		calice_de_fogo = g.redimensionar_imagem(temp_img, 100 , 150, verdadeiro)
		g.liberar_imagem(temp_img)

		temp_img = g.carregar_imagem("imagem/harry_potter/enigma_do_principe.png")
		enigma_do_principe = g.redimensionar_imagem(temp_img, 100 , 150, verdadeiro)
		g.liberar_imagem(temp_img)

		temp_img = g.carregar_imagem("imagem/harry_potter/ordem_da_fenix.png")
		ordem_da_fenix = g.redimensionar_imagem(temp_img, 100 , 150, verdadeiro)
		g.liberar_imagem(temp_img)

		temp_img = g.carregar_imagem("imagem/harry_potter/capa_pedra_filosofal.png")
		capa_pedra_filosofal = g.redimensionar_imagem(temp_img, 120 , 18, verdadeiro)
		g.liberar_imagem(temp_img)

		temp_img = g.carregar_imagem("imagem/harry_potter/capa_prisioneiro_de_azkaban.png")
		capa_prisioneiro_de_azkaban = g.redimensionar_imagem(temp_img, 120 , 18, verdadeiro)
		g.liberar_imagem(temp_img)

		temp_img = g.carregar_imagem("imagem/harry_potter/capa_camara_secreta.png")
		capa_camara_secreta = g.redimensionar_imagem(temp_img, 120 , 18, verdadeiro)
		g.liberar_imagem(temp_img)

		temp_img = g.carregar_imagem("imagem/harry_potter/capa_calice_de_fogo.png")
		capa_calice_de_fogo = g.redimensionar_imagem(temp_img, 120 , 18, verdadeiro)
		g.liberar_imagem(temp_img)

		temp_img = g.carregar_imagem("imagem/harry_potter/capa_enigma_do_principe.png")
		capa_enigma_do_principe = g.redimensionar_imagem(temp_img, 120 , 18, verdadeiro)
		g.liberar_imagem(temp_img)

		temp_img = g.carregar_imagem("imagem/harry_potter/capa_ordem_da_fenix.png")
		capa_ordem_da_fenix = g.redimensionar_imagem(temp_img, 120 , 18, verdadeiro)
		g.liberar_imagem(temp_img)

		temp_img = g.carregar_imagem("imagem/senai_logo.png")
		senai_logo_carregamento = g.redimensionar_imagem(temp_img, 200 , 70, verdadeiro)
		g.liberar_imagem(temp_img)

		temp_img = g.carregar_imagem("imagem/game_of_thrones/logo_game_of_thrones.png")
		logo_game_of_thrones = g.redimensionar_imagem(temp_img, 200 , 40, verdadeiro)
		g.liberar_imagem(temp_img)

		temp_img = g.carregar_imagem("imagem/game_of_thrones/game_of_thrones.png")
		game_of_thrones = g.redimensionar_imagem(temp_img, 100 , 150, verdadeiro)
		g.liberar_imagem(temp_img)

		temp_img = g.carregar_imagem("imagem/game_of_thrones/clash_of_kings.png")
		clash_of_kings = g.redimensionar_imagem(temp_img, 100 , 150, verdadeiro)
		g.liberar_imagem(temp_img)

		temp_img = g.carregar_imagem("imagem/game_of_thrones/feast_for_crows.png")
		feast_for_crows = g.redimensionar_imagem(temp_img, 100 , 150, verdadeiro)
		g.liberar_imagem(temp_img)

		temp_img = g.carregar_imagem("imagem/game_of_thrones/storm_of_swords.png")
		storm_of_swords = g.redimensionar_imagem(temp_img, 100 , 150, verdadeiro)
		g.liberar_imagem(temp_img)

		temp_img = g.carregar_imagem("imagem/game_of_thrones/dance_with_dragons.png")
		dance_with_dragons = g.redimensionar_imagem(temp_img, 100 , 150, verdadeiro)
		g.liberar_imagem(temp_img)

		temp_img = g.carregar_imagem("imagem/game_of_thrones/capa_game_of_thrones.png")
		capa_game_of_thrones = g.redimensionar_imagem(temp_img, 120 , 18, verdadeiro)
		g.liberar_imagem(temp_img)

		temp_img = g.carregar_imagem("imagem/game_of_thrones/capa_clash_of_kings.png")
		capa_clash_of_kings = g.redimensionar_imagem(temp_img, 120 , 18, verdadeiro)
		g.liberar_imagem(temp_img)

		temp_img = g.carregar_imagem("imagem/game_of_thrones/capa_feast_for_crows.png")
		capa_feast_for_crows = g.redimensionar_imagem(temp_img, 120 , 18, verdadeiro)
		g.liberar_imagem(temp_img)

		temp_img = g.carregar_imagem("imagem/game_of_thrones/capa_storm_of_swords.png")
		capa_storm_of_swords = g.redimensionar_imagem(temp_img, 120 , 18, verdadeiro)
		g.liberar_imagem(temp_img)

		temp_img = g.carregar_imagem("imagem/game_of_thrones/capa_dance_with_dragons.png")
		capa_dance_with_dragons = g.redimensionar_imagem(temp_img, 120 , 18, verdadeiro)
		g.liberar_imagem(temp_img)
	
	}

	funcao definir_tela()
	{
		
		g.iniciar_modo_grafico(verdadeiro)
		g.definir_dimensoes_janela(largura_janela, altura_janela)
		g.definir_fonte_texto("Arial")
          g.definir_titulo_janela("BIBLIOTECA SENAI")
          
	}

	funcao carregar_tela_celular()
	{

		//Colocar desenho da tela de celular
		g.desenhar_imagem(0, 0, tela_celular)

		//Definir tela branca da parte de dentro co celular
		g.definir_cor(g.COR_BRANCO)
		g.desenhar_retangulo(22, 98, (largura_janela - 42), 550, falso, verdadeiro)

		//Definir cor e retangulo azul para colocar a logo do SENAI em cima
		g.definir_cor(0x006BB7)
		g.desenhar_retangulo(22, 98, (largura_janela - 42), 60, falso, verdadeiro)

	}

	funcao topo()
	{
		
		//Colocar logo do SENAI
		g.desenhar_imagem(122, 108, senai_logo)
		
	}

	funcao carregar_titulo()
	{
		
		//Colocando uma borda preta em volta do titulo
		g.definir_cor(g.COR_PRETO)
		g.desenhar_retangulo(22, 158, (largura_janela - 42), 52, falso, verdadeiro)
		
		//Preenchendo com cor de fundo cinza atrás do título
		g.definir_cor(0xdfdfdf)
		g.desenhar_retangulo(23, 159, (largura_janela - 44), 50, falso, verdadeiro)
		
		//Defininndo cor e tamanho do titulo- BIBLIOTECA DE LIVROS
		g.definir_cor(g.COR_PRETO)
		g.definir_estilo_texto(falso, verdadeiro, falso)

		//Imprimindo na tela o título
		g.desenhar_texto(22, 171, titulo)

	}

	funcao cabecalho()
	{
		
		g.definir_cor(0x006BB7)
		g.desenhar_retangulo(22, 598, (largura_janela - 42), 50, falso, verdadeiro)

		g.definir_cor(g.COR_BRANCO)
		g.definir_estilo_texto(verdadeiro,falso, falso)
		g.definir_tamanho_texto(14.0)
		g.desenhar_texto(125, 605, "Criado e Desenvolvido por")
		
		g.definir_estilo_texto(verdadeiro,verdadeiro, falso)
		g.definir_tamanho_texto(16.0)
		g.desenhar_texto(85, 625, "Jonathan Reinaldo Eichenberger")
		
	}
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1244; 
 * @DOBRAMENTO-CODIGO = [1257, 1299, 1429];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */