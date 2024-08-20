/*
Aluno: Jonathan Reinaldo Eichenberger
Curso: Desenvolvimento de sistemas
Módulo: Lógica de Programação
Professor: Fernando Cezar de Oliveira Lopes
Tipo de Entrega: Avaliativa
Atividade: Mercado com desconto aplicado
 */
programa
{
	inclua biblioteca Tipos    --> tp
	inclua biblioteca Util     --> u
	inclua biblioteca Teclado  --> t
	inclua biblioteca Mouse    --> m
	inclua biblioteca Graficos --> g

	//variaveis para definir a tela responsiva
	inteiro proporcao = 60
	inteiro largura_janela_responsiva = tp.real_para_inteiro((tp.inteiro_para_real(g.largura_tela()) / 100) * proporcao)
	inteiro altura_janela_responsiva = tp.real_para_inteiro((tp.inteiro_para_real(g.altura_tela()) / 100) * proporcao)

	//variaveis de navegação
	logico sair = falso
	inteiro opcao = 0

	//Variaveis para o controle de fps
	inteiro tempo = u.tempo_decorrido()
	inteiro espera = 16
	inteiro quantidade = 0
	
	funcao inicio()
	{
		inicializar()

		faca
		{
			se(u.tempo_decorrido() > tempo + espera)
			{
				escolha(opcao)
				{
					caso 0:
					{
						mostrar_menu_principal()
						g.renderizar()
						
						pare
					}
				}
				tempo = u.tempo_decorrido()
			}
				
		}enquanto(sair == falso)
	}

	funcao mostrar_menu_principal()
	{	
		real borda_esquerda
		real borda_direita
		real borda_superior
		real espaco_entre_opcoes 
		real largura_retangulo 
		real altura_retangulo 
		real borda_retangulo 
		inteiro cor_interno
		inteiro cor_borda
		inteiro temp_click
		

		borda_esquerda = 10.0
		borda_direita = 10.0
		borda_superior = 15.0
		espaco_entre_opcoes = 1.5
		largura_retangulo = 30.0
		altura_retangulo = 4.0
		borda_retangulo = 5.0
		cor_interno = g.COR_BRANCO
		cor_borda = 0xdfdfdf

		se(m.algum_botao_pressionado())
		{
			temp_click = m.ler_botao()
			
			se(temp_click == m.BOTAO_ESQUERDO e m.posicao_x() >= g.largura_janela() / 2  e m.posicao_x() <= g.largura_janela() e m.posicao_y() >= 0 e m.posicao_y() <= g.altura_janela())
			{
				quantidade++
			}
		}
		g.largura_janela()
		g.altura_janela()
		g.definir_cor(g.COR_AZUL)
		g.limpar()
		desenhar_retangulo(borda_esquerda, borda_direita, borda_superior, espaco_entre_opcoes, largura_retangulo, altura_retangulo, borda_retangulo, cor_interno, cor_borda, quantidade)

		
	}

	funcao desenhar_retangulo(real borda_esquerda, real borda_direita, real borda_superior, real espaco_entre_opcoes, real largura_retangulo, real altura_retangulo, real borda_retangulo, inteiro cor_interno, inteiro cor_borda, inteiro quantidade)
	{

		para(inteiro i = 0; i < quantidade; i++)
		{

			g.definir_cor(cor_borda)
			g.desenhar_retangulo(tp.real_para_inteiro(((tp.inteiro_para_real(g.largura_janela()) / 100) * borda_esquerda - (borda_retangulo/ 2))),
			tp.real_para_inteiro(((tp.inteiro_para_real(g.altura_janela()) / 100) * borda_superior) + (((tp.inteiro_para_real(g.altura_janela()) / 100) * altura_retangulo) * i) + (((tp.inteiro_para_real(g.altura_janela()) / 100) * espaco_entre_opcoes) * i - (borda_retangulo/2) + (borda_retangulo * i))),
			tp.real_para_inteiro(((tp.inteiro_para_real(g.largura_janela()) / 100) * largura_retangulo + (borda_retangulo * 2))),
			tp.real_para_inteiro(((tp.inteiro_para_real(g.altura_janela()) / 100) * altura_retangulo + (borda_retangulo * 2))),
			verdadeiro, verdadeiro)
			
			g.definir_cor(cor_interno)
			g.desenhar_retangulo(tp.real_para_inteiro(((tp.inteiro_para_real(g.largura_janela()) / 100) * borda_esquerda + (borda_retangulo/ 2))),
			tp.real_para_inteiro(((tp.inteiro_para_real(g.altura_janela()) / 100) * borda_superior) + (((tp.inteiro_para_real(g.altura_janela()) / 100) * altura_retangulo) * i) + (((tp.inteiro_para_real(g.altura_janela()) / 100) * espaco_entre_opcoes) * i) + (borda_retangulo * i) + (borda_retangulo/ 2)),
			tp.real_para_inteiro(((tp.inteiro_para_real(g.largura_janela()) / 100) * largura_retangulo)),
			tp.real_para_inteiro(((tp.inteiro_para_real(g.altura_janela()) / 100) * altura_retangulo)),
			verdadeiro, verdadeiro)

			g.definir_cor(g.COR_PRETO)

			g.desenhar_retangulo(tp.real_para_inteiro(((tp.inteiro_para_real(g.largura_janela()) / 100) * borda_esquerda + (borda_retangulo/ 2))),
			tp.real_para_inteiro(((tp.inteiro_para_real(g.altura_janela()) / 100) * borda_superior) + (((tp.inteiro_para_real(g.altura_janela()) / 100) * altura_retangulo) * i) + (((tp.inteiro_para_real(g.altura_janela()) / 100) * espaco_entre_opcoes) * i) + (borda_retangulo * i) + (borda_retangulo/ 2)),
			tp.real_para_inteiro(((tp.inteiro_para_real(g.largura_janela()) / 100) * largura_retangulo)),
			tp.real_para_inteiro(((tp.inteiro_para_real(g.altura_janela()) / 100) * altura_retangulo)),
			verdadeiro, falso)
			
			g.desenhar_retangulo(tp.real_para_inteiro(((tp.inteiro_para_real(g.largura_janela()) / 100) * borda_esquerda - (borda_retangulo/ 2))),
			tp.real_para_inteiro(((tp.inteiro_para_real(g.altura_janela()) / 100) * borda_superior) + (((tp.inteiro_para_real(g.altura_janela()) / 100) * altura_retangulo) * i) + (((tp.inteiro_para_real(g.altura_janela()) / 100) * espaco_entre_opcoes) * i - (borda_retangulo/2) + (borda_retangulo * i))),
			tp.real_para_inteiro(((tp.inteiro_para_real(g.largura_janela()) / 100) * largura_retangulo + (borda_retangulo * 2))),
			tp.real_para_inteiro(((tp.inteiro_para_real(g.altura_janela()) / 100) * altura_retangulo + (borda_retangulo * 2))),
			verdadeiro, falso)
		}
	}

	funcao inicializar()
	{
		g.iniciar_modo_grafico(verdadeiro)
		g.definir_dimensoes_janela(largura_janela_responsiva, altura_janela_responsiva)	
	}

}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 893; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */