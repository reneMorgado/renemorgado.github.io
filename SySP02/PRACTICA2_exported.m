classdef PRACTICA2_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                     matlab.ui.Figure
        btn1                         matlab.ui.control.Button
        btn2                         matlab.ui.control.Button
        btn3                         matlab.ui.control.Button
        btn4                         matlab.ui.control.Button
        FuncinftLabel                matlab.ui.control.Label
        TXTSenalR                    matlab.ui.control.EditField
        btnGraficar                  matlab.ui.control.Button
        EscalamientoHorizontalLabel  matlab.ui.control.Label
        SLeh                         matlab.ui.control.Slider
        EscalamientoVerticalLabel    matlab.ui.control.Label
        SLev                         matlab.ui.control.Slider
        DeEditFieldLabel             matlab.ui.control.Label
        TXTfrom                      matlab.ui.control.NumericEditField
        ALabel                       matlab.ui.control.Label
        TXTto                        matlab.ui.control.NumericEditField
        TXTnh                        matlab.ui.control.Label
        TXTnv                        matlab.ui.control.Label
        Image                        matlab.ui.control.Image
        btn5                         matlab.ui.control.Button
        TraslacinHorizontalLabel     matlab.ui.control.Label
        SLth                         matlab.ui.control.Slider
        TXTnh_2                      matlab.ui.control.Label
        TraslacinVerticalLabel       matlab.ui.control.Label
        SLtv                         matlab.ui.control.Slider
        TXTnv_2                      matlab.ui.control.Label
        Label                        matlab.ui.control.Label
        Label_2                      matlab.ui.control.Label
        Label_3                      matlab.ui.control.Label
        Label_4                      matlab.ui.control.Label
        btn6                         matlab.ui.control.Button
        btn7                         matlab.ui.control.Button
        EJEMPLOSLATHISECCIN111Label  matlab.ui.control.Label
        Axes                         matlab.ui.control.UIAxes
    end

    
    
    
    properties (Access = private)
        Property % Variables globales
        EH
        EV
        TH
        TV
        t
        intervalo
        f
        u
        g
    end
    
    methods (Access = private)
      
        
        function getSliders(app)
            app.EH= app.SLeh.Value;
            app.EV= app.SLev.Value;
            app.TH= app.SLth.Value;
            app.TV= app.SLtv.Value;
            
        end
    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function StartGUI(app)
            app.EH = 1;
            app.EV = 1;
            app.TH = 0;
            app.TV = 0;
            
            app.intervalo = [0:0.0001:2*pi];
           
            
        end

        % Button pushed function: btnGraficar
        function btnGraficarButtonPushed(app, event)
           cla(app.Axes,"reset");
           %getSliders(app);
            app.t = [app.TXTfrom.Value:0.0001:app.TXTto.Value];
            app.f = str2func(get(app.TXTSenalR,'Value'));
           plot (app.Axes,app.EH*app.t,app.EV.*app.f(app.EH*app.t));
          
         
        end

        % Button down function: Axes
        function AxesButtonDown(app, event)
          
        end

        % Value changed function: TXTSenalR
        function TXTSenalRValueChanged(app, event)
            
            
        end

        % Value changed function: SLeh
        function slideHorizontal(app, event)
            
            app.EH= app.SLeh.Value;
            app.TXTnh.Text = num2str (app.EH);
            cla(app.Axes,"reset");
            app.t = [app.TXTfrom.Value:0.0001:app.TXTto.Value];
            plot (app.Axes,app.EV.*app.t,(app.EV.*app.f(app.EH.*(app.t+app.TH)))+app.TV);
          
        end

        % Value changing function: SLev
        function slideVertical(app, event)
            app.EV= app.SLev.Value;
            app.TXTnv.Text = num2str (app.EV);
            cla(app.Axes,"reset");
            app.t = [app.TXTfrom.Value:0.0001:app.TXTto.Value];
            plot (app.Axes,app.t,(app.EV.*app.f(app.EH.*(app.t+app.TH)))+app.TV);
        end

        % Button pushed function: btn4
        function btn4ButtonPushed(app, event)
            g = (-1:0.01:2);
            p= @(t) 1.0.*((g>=0)&(g<1));
            app.Axes.YLim =[-1,1];
            plot(app.Axes,g,p(g));
            
        end

        % Button pushed function: btn1
        function btn1ButtonPushed(app, event)

          t0 = [-2:0.01:2];
          app.f = @(t0) exp(-t0).*cos(2 * pi * t0);
          app.Axes.YLim =[-7,7];
          app.Axes.XLim = [-2,2];
          plot (app.Axes,t0,app.f(t0));
        end

        % Button pushed function: btn2
        function btn2ButtonPushed(app, event)
            t0 = [-2:2];
            u = @(t0) 1.0.*(t0>=0);
            app.Axes.YLim =[0,1];
            app.Axes.XLim = [-2,2];
            plot(app.Axes,t0, u(t0));
            
        end

        % Button pushed function: btn3
        function btn3ButtonPushed(app, event)
            r = (-2:0.01:2); 
            u = @(r) 1.0.*(r>=0);
            app.Axes.YLim =[-1,1];
            app.Axes.XLim = [-2,2];
            plot(app.Axes,r,u(r));
        end

        % Button pushed function: btn5
        function btn5ButtonPushed(app, event)
         
         h = (-2: 0.01:2);
         F = @(h) exp(-h).*cos(2 * pi * h);
         u = @(h) 1.0.*(h>=0);
         g = @(h) F(h).*u(h);
         app.Axes.YLim =[-1.5,1.5];
         app.Axes.XLim = [-2,2];
         plot(app.Axes,h, g(2*h+1)); 
            
        end

        % Value changed function: SLth
        function SLthValueChanged(app, event)
            app.TH = app.SLth.Value;
            app.TXTnh_2.Text= num2str(app.TH);
            app.t = [app.TXTfrom.Value:0.0001:app.TXTto.Value];
            plot (app.Axes,app.t,(app.EV.*app.f(app.EH.*(app.t+app.TH)))+app.TV);
            
            
            
        end

        % Value changed function: SLtv
        function SLtvValueChanged(app, event)
            app.TV = app.SLtv.Value;
            app.TXTnv_2.Text= num2str(app.TV);
            app.t = [app.TXTfrom.Value:0.0001:app.TXTto.Value];
            plot (app.Axes,app.t,(app.EV.*app.f(app.EH.*(app.t+app.TH)))+app.TV);
            
        end

        % Button pushed function: btn6
        function btn6ButtonPushed(app, event)
    
         h = (-2: 0.01:2);
         F = @(h) exp(-h).*cos(2 * pi * h);
         u = @(h) 1.0.*(h>=0);
         g = @(h) F(h).*u(h);
         app.Axes.YLim =[-1.5,1.5];
         app.Axes.XLim = [-2,2];
         plot(app.Axes,h, g(-h+1)); 
            
            
            
        end

        % Button pushed function: btn7
        function btn7ButtonPushed(app, event)
        
         h = (-2: 0.01:2);
         F = @(h) exp(-h).*cos(2 * pi * h);
         u = @(h) 1.0.*(h>=0);
         g = @(h) F(h).*u(h);
         app.Axes.YLim =[-1.5,1.5];
         app.Axes.XLim = [-2,2];
         plot(app.Axes,h, g(2*h+1)-g(-h+1)); 
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Color = [0.9882 0.9608 0.6196];
            app.UIFigure.Position = [100 100 892 560];
            app.UIFigure.Name = 'MATLAB App';

            % Create btn1
            app.btn1 = uibutton(app.UIFigure, 'push');
            app.btn1.ButtonPushedFcn = createCallbackFcn(app, @btn1ButtonPushed, true);
            app.btn1.BackgroundColor = [0.8471 0.6745 0.5765];
            app.btn1.FontName = 'Yu Gothic UI Semibold';
            app.btn1.FontWeight = 'bold';
            app.btn1.FontColor = [0.149 0.149 0.149];
            app.btn1.Position = [686 467 52 25];
            app.btn1.Text = ' 1.11-1';

            % Create btn2
            app.btn2 = uibutton(app.UIFigure, 'push');
            app.btn2.ButtonPushedFcn = createCallbackFcn(app, @btn2ButtonPushed, true);
            app.btn2.BackgroundColor = [0.8471 0.6745 0.5765];
            app.btn2.FontName = 'Yu Gothic UI Semibold';
            app.btn2.FontWeight = 'bold';
            app.btn2.FontColor = [0.149 0.149 0.149];
            app.btn2.Position = [592 426 52 25];
            app.btn2.Text = '1.11-2  A';

            % Create btn3
            app.btn3 = uibutton(app.UIFigure, 'push');
            app.btn3.ButtonPushedFcn = createCallbackFcn(app, @btn3ButtonPushed, true);
            app.btn3.BackgroundColor = [0.8471 0.6745 0.5765];
            app.btn3.FontName = 'Yu Gothic UI Semibold';
            app.btn3.FontWeight = 'bold';
            app.btn3.FontColor = [0.149 0.149 0.149];
            app.btn3.Position = [592 377 52 25];
            app.btn3.Text = '1.11-2  B';

            % Create btn4
            app.btn4 = uibutton(app.UIFigure, 'push');
            app.btn4.ButtonPushedFcn = createCallbackFcn(app, @btn4ButtonPushed, true);
            app.btn4.BackgroundColor = [0.8471 0.6745 0.5765];
            app.btn4.FontName = 'Yu Gothic UI Semibold';
            app.btn4.FontWeight = 'bold';
            app.btn4.FontColor = [0.149 0.149 0.149];
            app.btn4.Position = [592 328 52 25];
            app.btn4.Text = {'1.11-2  C'; ''};

            % Create FuncinftLabel
            app.FuncinftLabel = uilabel(app.UIFigure);
            app.FuncinftLabel.HorizontalAlignment = 'right';
            app.FuncinftLabel.FontName = 'Yu Gothic UI Semibold';
            app.FuncinftLabel.Position = [23 149 83 22];
            app.FuncinftLabel.Text = 'Función  f(t) =';

            % Create TXTSenalR
            app.TXTSenalR = uieditfield(app.UIFigure, 'text');
            app.TXTSenalR.ValueChangedFcn = createCallbackFcn(app, @TXTSenalRValueChanged, true);
            app.TXTSenalR.FontName = 'Yu Gothic UI Semibold';
            app.TXTSenalR.Position = [121 149 232 22];
            app.TXTSenalR.Value = '@(t) ';

            % Create btnGraficar
            app.btnGraficar = uibutton(app.UIFigure, 'push');
            app.btnGraficar.ButtonPushedFcn = createCallbackFcn(app, @btnGraficarButtonPushed, true);
            app.btnGraficar.BackgroundColor = [0.9804 0.8353 0.4706];
            app.btnGraficar.FontName = 'Segoe UI';
            app.btnGraficar.FontSize = 14;
            app.btnGraficar.FontWeight = 'bold';
            app.btnGraficar.Position = [405 148 100 28];
            app.btnGraficar.Text = 'GRAFICAR';

            % Create EscalamientoHorizontalLabel
            app.EscalamientoHorizontalLabel = uilabel(app.UIFigure);
            app.EscalamientoHorizontalLabel.HorizontalAlignment = 'right';
            app.EscalamientoHorizontalLabel.FontName = 'Yu Gothic UI Semibold';
            app.EscalamientoHorizontalLabel.Position = [23 111 137 22];
            app.EscalamientoHorizontalLabel.Text = 'Escalamiento Horizontal';

            % Create SLeh
            app.SLeh = uislider(app.UIFigure);
            app.SLeh.Limits = [-10 10];
            app.SLeh.MajorTicks = [-10 -8 -6 -4 -2 0 2 4 6 8 10];
            app.SLeh.MajorTickLabels = {'-10,-8,-6,-4,-2,0,2,4,6,8,10'};
            app.SLeh.ValueChangedFcn = createCallbackFcn(app, @slideHorizontal, true);
            app.SLeh.MinorTicks = [];
            app.SLeh.FontName = 'Yu Gothic UI Semibold';
            app.SLeh.Position = [181 120 194 3];
            app.SLeh.Value = 1;

            % Create EscalamientoVerticalLabel
            app.EscalamientoVerticalLabel = uilabel(app.UIFigure);
            app.EscalamientoVerticalLabel.HorizontalAlignment = 'right';
            app.EscalamientoVerticalLabel.FontName = 'Yu Gothic UI Semibold';
            app.EscalamientoVerticalLabel.Position = [495 104 121 22];
            app.EscalamientoVerticalLabel.Text = 'Escalamiento Vertical';

            % Create SLev
            app.SLev = uislider(app.UIFigure);
            app.SLev.Limits = [-10 10];
            app.SLev.MajorTicks = [-10 -8 -6 -4 -2 0 2 4 6 8 10];
            app.SLev.MajorTickLabels = {'-10,-8,-6,-4,-2,0,2,4,6,8,10'};
            app.SLev.ValueChangingFcn = createCallbackFcn(app, @slideVertical, true);
            app.SLev.MinorTicks = [];
            app.SLev.FontName = 'Yu Gothic UI Semibold';
            app.SLev.Position = [637 113 150 3];

            % Create DeEditFieldLabel
            app.DeEditFieldLabel = uilabel(app.UIFigure);
            app.DeEditFieldLabel.HorizontalAlignment = 'right';
            app.DeEditFieldLabel.FontName = 'Segoe UI';
            app.DeEditFieldLabel.FontWeight = 'bold';
            app.DeEditFieldLabel.Position = [637 154 25 22];
            app.DeEditFieldLabel.Text = 'De';

            % Create TXTfrom
            app.TXTfrom = uieditfield(app.UIFigure, 'numeric');
            app.TXTfrom.FontName = 'Segoe UI';
            app.TXTfrom.FontWeight = 'bold';
            app.TXTfrom.Position = [677 154 30 22];
            app.TXTfrom.Value = -4;

            % Create ALabel
            app.ALabel = uilabel(app.UIFigure);
            app.ALabel.HorizontalAlignment = 'right';
            app.ALabel.FontName = 'Segoe UI';
            app.ALabel.FontWeight = 'bold';
            app.ALabel.Position = [717 154 25 22];
            app.ALabel.Text = 'A';

            % Create TXTto
            app.TXTto = uieditfield(app.UIFigure, 'numeric');
            app.TXTto.FontName = 'Yu Gothic UI Semibold';
            app.TXTto.Position = [757 154 30 22];
            app.TXTto.Value = 4;

            % Create TXTnh
            app.TXTnh = uilabel(app.UIFigure);
            app.TXTnh.FontName = 'Yu Gothic UI Semibold';
            app.TXTnh.FontSize = 18;
            app.TXTnh.FontWeight = 'bold';
            app.TXTnh.Position = [392 98 132 36];
            app.TXTnh.Text = '1';

            % Create TXTnv
            app.TXTnv = uilabel(app.UIFigure);
            app.TXTnv.FontName = 'Yu Gothic UI Semibold';
            app.TXTnv.FontSize = 18;
            app.TXTnv.FontWeight = 'bold';
            app.TXTnv.Position = [833 92 116 36];
            app.TXTnv.Text = '1';

            % Create Image
            app.Image = uiimage(app.UIFigure);
            app.Image.Position = [657 203 110 100];
            app.Image.ImageSource = 'upiita.png';

            % Create btn5
            app.btn5 = uibutton(app.UIFigure, 'push');
            app.btn5.ButtonPushedFcn = createCallbackFcn(app, @btn5ButtonPushed, true);
            app.btn5.BackgroundColor = [0.8471 0.6745 0.5765];
            app.btn5.FontName = 'Yu Gothic UI Semibold';
            app.btn5.FontWeight = 'bold';
            app.btn5.FontColor = [0.149 0.149 0.149];
            app.btn5.Position = [774 426 60 25];
            app.btn5.Text = {'1.11-2  D'; ''};

            % Create TraslacinHorizontalLabel
            app.TraslacinHorizontalLabel = uilabel(app.UIFigure);
            app.TraslacinHorizontalLabel.HorizontalAlignment = 'right';
            app.TraslacinHorizontalLabel.FontName = 'Yu Gothic UI Semibold';
            app.TraslacinHorizontalLabel.Position = [13 44 137 23];
            app.TraslacinHorizontalLabel.Text = 'Traslación  Horizontal';

            % Create SLth
            app.SLth = uislider(app.UIFigure);
            app.SLth.Limits = [-10 10];
            app.SLth.MajorTicks = [-10 -8 -6 -4 -2 0 2 4 6 8 10];
            app.SLth.MajorTickLabels = {'-10,-8,-6,-4,-2,0,2,4,6,8,10'};
            app.SLth.ValueChangedFcn = createCallbackFcn(app, @SLthValueChanged, true);
            app.SLth.MinorTicks = [];
            app.SLth.FontName = 'Yu Gothic UI Semibold';
            app.SLth.Position = [171 54 195 3];

            % Create TXTnh_2
            app.TXTnh_2 = uilabel(app.UIFigure);
            app.TXTnh_2.FontName = 'Yu Gothic UI Semibold';
            app.TXTnh_2.FontSize = 18;
            app.TXTnh_2.FontWeight = 'bold';
            app.TXTnh_2.Position = [383 46 132 36];
            app.TXTnh_2.Text = '0';

            % Create TraslacinVerticalLabel
            app.TraslacinVerticalLabel = uilabel(app.UIFigure);
            app.TraslacinVerticalLabel.HorizontalAlignment = 'right';
            app.TraslacinVerticalLabel.FontName = 'Yu Gothic UI Semibold';
            app.TraslacinVerticalLabel.Position = [487 46 121 23];
            app.TraslacinVerticalLabel.Text = 'Traslación  Vertical';

            % Create SLtv
            app.SLtv = uislider(app.UIFigure);
            app.SLtv.Limits = [-10 10];
            app.SLtv.MajorTicks = [-10 -8 -6 -4 -2 0 2 4 6 8 10];
            app.SLtv.MajorTickLabels = {'-10,-8,-6,-4,-2,0,2,4,6,8,10'};
            app.SLtv.ValueChangedFcn = createCallbackFcn(app, @SLtvValueChanged, true);
            app.SLtv.MinorTicks = [];
            app.SLtv.FontName = 'Yu Gothic UI Semibold';
            app.SLtv.Position = [629 56 166 3];

            % Create TXTnv_2
            app.TXTnv_2 = uilabel(app.UIFigure);
            app.TXTnv_2.FontName = 'Yu Gothic UI Semibold';
            app.TXTnv_2.FontSize = 18;
            app.TXTnv_2.FontWeight = 'bold';
            app.TXTnv_2.Position = [833 36 116 36];
            app.TXTnv_2.Text = '0';

            % Create Label
            app.Label = uilabel(app.UIFigure);
            app.Label.BackgroundColor = [0.9882 0.9608 0.6196];
            app.Label.Position = [50 77 433 28];
            app.Label.Text = '';

            % Create Label_2
            app.Label_2 = uilabel(app.UIFigure);
            app.Label_2.BackgroundColor = [0.9882 0.9608 0.6196];
            app.Label_2.Position = [69 11 358 26];
            app.Label_2.Text = '';

            % Create Label_3
            app.Label_3 = uilabel(app.UIFigure);
            app.Label_3.BackgroundColor = [0.9882 0.9608 0.6196];
            app.Label_3.Position = [536 13 265 24];
            app.Label_3.Text = '';

            % Create Label_4
            app.Label_4 = uilabel(app.UIFigure);
            app.Label_4.BackgroundColor = [0.9882 0.9608 0.6196];
            app.Label_4.Position = [536 74 265 24];
            app.Label_4.Text = '';

            % Create btn6
            app.btn6 = uibutton(app.UIFigure, 'push');
            app.btn6.ButtonPushedFcn = createCallbackFcn(app, @btn6ButtonPushed, true);
            app.btn6.BackgroundColor = [0.8471 0.6745 0.5765];
            app.btn6.FontName = 'Yu Gothic UI Semibold';
            app.btn6.FontWeight = 'bold';
            app.btn6.FontColor = [0.149 0.149 0.149];
            app.btn6.Position = [774 376 60 26];
            app.btn6.Text = {'1.11-2  E'; ''};

            % Create btn7
            app.btn7 = uibutton(app.UIFigure, 'push');
            app.btn7.ButtonPushedFcn = createCallbackFcn(app, @btn7ButtonPushed, true);
            app.btn7.BackgroundColor = [0.8471 0.6745 0.5765];
            app.btn7.FontName = 'Yu Gothic UI Semibold';
            app.btn7.FontWeight = 'bold';
            app.btn7.FontColor = [0.149 0.149 0.149];
            app.btn7.Position = [774 327 60 26];
            app.btn7.Text = {'1.11-2  F'; ''};

            % Create EJEMPLOSLATHISECCIN111Label
            app.EJEMPLOSLATHISECCIN111Label = uilabel(app.UIFigure);
            app.EJEMPLOSLATHISECCIN111Label.FontName = 'Segoe UI';
            app.EJEMPLOSLATHISECCIN111Label.FontWeight = 'bold';
            app.EJEMPLOSLATHISECCIN111Label.Position = [613 522 186 22];
            app.EJEMPLOSLATHISECCIN111Label.Text = 'EJEMPLOS LATHI  SECCIÓN 1.11';

            % Create Axes
            app.Axes = uiaxes(app.UIFigure);
            title(app.Axes, 'Gráfica')
            xlabel(app.Axes, 't')
            ylabel(app.Axes, {'f(t)'; ''})
            zlabel(app.Axes, 'Z')
            app.Axes.PlotBoxAspectRatio = [1.44039735099338 1 1];
            app.Axes.XLim = [-2 2];
            app.Axes.YLim = [-7 7];
            app.Axes.XAxisLocation = 'origin';
            app.Axes.YAxisLocation = 'origin';
            app.Axes.XGrid = 'on';
            app.Axes.YGrid = 'on';
            app.Axes.ButtonDownFcn = createCallbackFcn(app, @AxesButtonDown, true);
            app.Axes.Position = [23 188 482 356];

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = PRACTICA2_exported

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            % Execute the startup function
            runStartupFcn(app, @StartGUI)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end