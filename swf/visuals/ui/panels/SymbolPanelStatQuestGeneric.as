package visuals.ui.panels
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolPlaceholderGeneric;
   import visuals.ui.base.SymbolUiButtonDefaultGeneric;
   import visuals.ui.elements.avatar.SymbolAvatarGeneric;
   import visuals.ui.elements.backgrounds.SymbolBackgroundScalableGeneric;
   import visuals.ui.elements.gauge.SymbolGaugeGeneric;
   import visuals.ui.elements.gauge.SymbolStatQuestPanelTopGeneric;
   import visuals.ui.elements.icons.SymbolIconExclamationMarkGeneric;
   import visuals.ui.elements.quest.SymbolQuestBriefingStatsGeneric;
   
   public class SymbolPanelStatQuestGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolPanelStatQuest = null;
      
      public var avatar:SymbolAvatarGeneric = null;
      
      public var npc:SymbolPlaceholderGeneric = null;
      
      public var symbolBackgroundScalable:SymbolBackgroundScalableGeneric = null;
      
      public var symbolBackgroundScalable2:SymbolBackgroundScalableGeneric = null;
      
      public var txtHint:ILabelArea = null;
      
      public var symbolIconExclamationMark:SymbolIconExclamationMarkGeneric = null;
      
      public var panelTop:SymbolStatQuestPanelTopGeneric = null;
      
      public var gauge:SymbolGaugeGeneric = null;
      
      public var btnSkip:SymbolUiButtonDefaultGeneric = null;
      
      public var stats:SymbolQuestBriefingStatsGeneric = null;
      
      public function SymbolPanelStatQuestGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolPanelStatQuest;
         }
         else
         {
            _nativeObject = new SymbolPanelStatQuest();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         avatar = new SymbolAvatarGeneric(_nativeObject.avatar);
         npc = new SymbolPlaceholderGeneric(_nativeObject.npc);
         symbolBackgroundScalable = new SymbolBackgroundScalableGeneric(_nativeObject.symbolBackgroundScalable);
         symbolBackgroundScalable2 = new SymbolBackgroundScalableGeneric(_nativeObject.symbolBackgroundScalable2);
         txtHint = FlashLabelArea.fromNative(_nativeObject.txtHint);
         symbolIconExclamationMark = new SymbolIconExclamationMarkGeneric(_nativeObject.symbolIconExclamationMark);
         panelTop = new SymbolStatQuestPanelTopGeneric(_nativeObject.panelTop);
         gauge = new SymbolGaugeGeneric(_nativeObject.gauge);
         btnSkip = new SymbolUiButtonDefaultGeneric(_nativeObject.btnSkip);
         stats = new SymbolQuestBriefingStatsGeneric(_nativeObject.stats);
      }
      
      public function setNativeInstance(param1:SymbolPanelStatQuest) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.avatar)
         {
            avatar.setNativeInstance(_nativeObject.avatar);
         }
         if(_nativeObject.npc)
         {
            npc.setNativeInstance(_nativeObject.npc);
         }
         if(_nativeObject.symbolBackgroundScalable)
         {
            symbolBackgroundScalable.setNativeInstance(_nativeObject.symbolBackgroundScalable);
         }
         if(_nativeObject.symbolBackgroundScalable2)
         {
            symbolBackgroundScalable2.setNativeInstance(_nativeObject.symbolBackgroundScalable2);
         }
         FlashLabelArea.setNativeInstance(txtHint,_nativeObject.txtHint);
         if(_nativeObject.symbolIconExclamationMark)
         {
            symbolIconExclamationMark.setNativeInstance(_nativeObject.symbolIconExclamationMark);
         }
         if(_nativeObject.panelTop)
         {
            panelTop.setNativeInstance(_nativeObject.panelTop);
         }
         if(_nativeObject.gauge)
         {
            gauge.setNativeInstance(_nativeObject.gauge);
         }
         if(_nativeObject.btnSkip)
         {
            btnSkip.setNativeInstance(_nativeObject.btnSkip);
         }
         if(_nativeObject.stats)
         {
            stats.setNativeInstance(_nativeObject.stats);
         }
      }
   }
}
