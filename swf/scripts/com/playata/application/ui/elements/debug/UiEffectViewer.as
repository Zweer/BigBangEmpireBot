package com.playata.application.ui.elements.debug
{
   import com.playata.application.data.item.Item;
   import com.playata.application.data.story_dungeon.StoryDungeon;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.effects.EffectsLayer;
   import com.playata.application.ui.effects.IEffect;
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.DisplayObjectFactory;
   import com.playata.framework.display.IQuad;
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.ui.Align;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.display.ui.controls.TextFieldFormat;
   import com.playata.framework.input.InteractionEvent;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   import visuals.ui.elements.buttons.SymbolButtonPlusGeneric;
   
   public class UiEffectViewer
   {
       
      
      private var _content:Sprite = null;
      
      private var _info:ILabel = null;
      
      private var _emitter1:IQuad = null;
      
      private var _currentEffect:IEffect = null;
      
      private var _index:int = 0;
      
      public function UiEffectViewer()
      {
         super();
         _content = new Sprite();
         _info = DisplayObjectFactory.createLabel(70,20,500,50,"",new TextFieldFormat("Verdana",12,16777215,true,Align.LEFT,Align.TOP));
         _content.addChild(_info);
         _emitter1 = DisplayObjectFactory.createQuadFromSettings({
            "width":10,
            "height":10,
            "color":16711680,
            "x":540,
            "y":315
         });
         _content.addChild(_emitter1);
         var closeButton:UiButton = new UiButton(new SymbolButtonCloseGeneric(),"",function(param1:InteractionEvent):void
         {
            close();
         });
         closeButton.align(Align.TOP,Align.RIGHT,-closeButton.width,closeButton.height);
         _content.addChild(closeButton);
         var nextButton:UiButton = new UiButton(new SymbolButtonPlusGeneric(),"",function(param1:InteractionEvent):void
         {
            nextEffect();
         });
         nextButton.align(Align.TOP,Align.LEFT,closeButton.width,closeButton.height);
         _content.addChild(nextButton);
         Environment.display.displayContext.stage.addChild(_content);
      }
      
      private function close() : void
      {
         Environment.display.displayContext.stage.removeChild(_content);
      }
      
      private function nextEffect() : void
      {
         var _loc1_:* = null;
         if(_currentEffect != null)
         {
            _currentEffect.shutDown();
         }
         var _loc2_:* = _index;
         switch(_loc2_)
         {
            case 0:
               _currentEffect = EffectsLayer.instance.show(0,{
                  "emitter":_emitter1,
                  "amount":10
               });
               break;
            case 1:
               _currentEffect = EffectsLayer.instance.show(2,{"emitter":_emitter1});
               break;
            case 2:
               _currentEffect = EffectsLayer.instance.show(1,{"emitter":_emitter1});
               break;
            case 3:
               _currentEffect = EffectsLayer.instance.show(7,{"emitter":_emitter1});
               break;
            case 4:
               _currentEffect = EffectsLayer.instance.show(4,{"emitter":_emitter1});
               break;
            case 5:
               _currentEffect = EffectsLayer.instance.show(5,{"emitter":_emitter1});
               break;
            case 6:
               _currentEffect = EffectsLayer.instance.show(6,{"emitter":_emitter1});
               break;
            case 7:
               _loc1_ = User.current.character.getItemByType(1);
               _currentEffect = EffectsLayer.instance.show(3,{
                  "emitter":_emitter1,
                  "imageUrl":_loc1_.iconImageUrl
               });
               break;
            case 8:
               _currentEffect = EffectsLayer.instance.show(13,{"emitter":_emitter1});
               break;
            case 9:
               _currentEffect = EffectsLayer.instance.show(12,{
                  "emitter":_emitter1,
                  "movie_panel":true
               });
               break;
            case 10:
               _currentEffect = EffectsLayer.instance.show(100,{});
               break;
            case 11:
               _currentEffect = EffectsLayer.instance.show(112,{});
               break;
            case 12:
               _currentEffect = EffectsLayer.instance.show(111,{});
               break;
            case 13:
               _currentEffect = EffectsLayer.instance.show(113,{});
               break;
            case 14:
               _currentEffect = EffectsLayer.instance.show(105,{"mode":"convention"});
               break;
            case 15:
               _currentEffect = EffectsLayer.instance.show(105,{"mode":"show"});
               break;
            case 16:
               _currentEffect = EffectsLayer.instance.show(114,{});
               break;
            case 17:
               _currentEffect = EffectsLayer.instance.show(104,{});
               break;
            case 18:
               _currentEffect = EffectsLayer.instance.show(110,{});
               break;
            case 19:
               _currentEffect = EffectsLayer.instance.show(101,{"numSprites":20});
               break;
            case 20:
               _currentEffect = EffectsLayer.instance.show(102,{});
               break;
            case 21:
               _currentEffect = EffectsLayer.instance.show(14,{
                  "emitter":_emitter1,
                  "imageUrl":StoryDungeon.getUnlockPointImageUrl(1)
               });
               break;
            case 22:
               _currentEffect = EffectsLayer.instance.show(9);
               break;
            case 23:
               _currentEffect = EffectsLayer.instance.show(10,{"emitter":_emitter1});
               break;
            case 24:
               _currentEffect = EffectsLayer.instance.show(11,{
                  "x":100,
                  "y":100,
                  "r":105
               });
               break;
            case 25:
               _currentEffect = EffectsLayer.instance.show(106,{
                  "emitter":_emitter1,
                  "quality":2
               });
               break;
            case 26:
               _currentEffect = EffectsLayer.instance.show(107,{
                  "emitter":_emitter1,
                  "quality":3
               });
               _currentEffect = EffectsLayer.instance.show(108,{"emitter":_emitter1});
               break;
            case 27:
               _currentEffect = EffectsLayer.instance.show(109,{
                  "emitter":_emitter1,
                  "quality":3
               });
               break;
            case 28:
               _currentEffect = EffectsLayer.instance.show(8,{"emitter":_emitter1});
         }
         _info.text = _index.toString();
         _index = Number(_index) + 1;
         if(_index >= 28)
         {
            _index = 0;
         }
      }
   }
}
