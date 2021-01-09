package visuals.ui.elements.stream
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolUiButtonDefaultGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowDownGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowUpGeneric;
   import visuals.ui.elements.dungeon.SymbolDungeonPhotoBigGeneric;
   import visuals.ui.elements.stats.SymbolStatsBattleSkillBackgroundGeneric;
   
   public class SymbolResourceRequestListGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolResourceRequestList = null;
      
      public var line1:SymbolResourceRequestGeneric = null;
      
      public var line2:SymbolResourceRequestGeneric = null;
      
      public var line3:SymbolResourceRequestGeneric = null;
      
      public var line4:SymbolResourceRequestGeneric = null;
      
      public var line5:SymbolResourceRequestGeneric = null;
      
      public var btnUp:SymbolButtonArrowUpGeneric = null;
      
      public var btnDown:SymbolButtonArrowDownGeneric = null;
      
      public var noRequestsBackground:SymbolStatsBattleSkillBackgroundGeneric = null;
      
      public var btnInvite:SymbolUiButtonDefaultGeneric = null;
      
      public var txtNoRequests:ILabelArea = null;
      
      public var photo1:SymbolDungeonPhotoBigGeneric = null;
      
      public var photo2:SymbolDungeonPhotoBigGeneric = null;
      
      public var photo3:SymbolDungeonPhotoBigGeneric = null;
      
      public function SymbolResourceRequestListGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolResourceRequestList;
         }
         else
         {
            _nativeObject = new SymbolResourceRequestList();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         line1 = new SymbolResourceRequestGeneric(_nativeObject.line1);
         line2 = new SymbolResourceRequestGeneric(_nativeObject.line2);
         line3 = new SymbolResourceRequestGeneric(_nativeObject.line3);
         line4 = new SymbolResourceRequestGeneric(_nativeObject.line4);
         line5 = new SymbolResourceRequestGeneric(_nativeObject.line5);
         btnUp = new SymbolButtonArrowUpGeneric(_nativeObject.btnUp);
         btnDown = new SymbolButtonArrowDownGeneric(_nativeObject.btnDown);
         noRequestsBackground = new SymbolStatsBattleSkillBackgroundGeneric(_nativeObject.noRequestsBackground);
         btnInvite = new SymbolUiButtonDefaultGeneric(_nativeObject.btnInvite);
         txtNoRequests = FlashLabelArea.fromNative(_nativeObject.txtNoRequests);
         photo1 = new SymbolDungeonPhotoBigGeneric(_nativeObject.photo1);
         photo2 = new SymbolDungeonPhotoBigGeneric(_nativeObject.photo2);
         photo3 = new SymbolDungeonPhotoBigGeneric(_nativeObject.photo3);
      }
      
      public function setNativeInstance(param1:SymbolResourceRequestList) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.line1)
         {
            line1.setNativeInstance(_nativeObject.line1);
         }
         if(_nativeObject.line2)
         {
            line2.setNativeInstance(_nativeObject.line2);
         }
         if(_nativeObject.line3)
         {
            line3.setNativeInstance(_nativeObject.line3);
         }
         if(_nativeObject.line4)
         {
            line4.setNativeInstance(_nativeObject.line4);
         }
         if(_nativeObject.line5)
         {
            line5.setNativeInstance(_nativeObject.line5);
         }
         if(_nativeObject.btnUp)
         {
            btnUp.setNativeInstance(_nativeObject.btnUp);
         }
         if(_nativeObject.btnDown)
         {
            btnDown.setNativeInstance(_nativeObject.btnDown);
         }
         if(_nativeObject.noRequestsBackground)
         {
            noRequestsBackground.setNativeInstance(_nativeObject.noRequestsBackground);
         }
         if(_nativeObject.btnInvite)
         {
            btnInvite.setNativeInstance(_nativeObject.btnInvite);
         }
         FlashLabelArea.setNativeInstance(txtNoRequests,_nativeObject.txtNoRequests);
         if(_nativeObject.photo1)
         {
            photo1.setNativeInstance(_nativeObject.photo1);
         }
         if(_nativeObject.photo2)
         {
            photo2.setNativeInstance(_nativeObject.photo2);
         }
         if(_nativeObject.photo3)
         {
            photo3.setNativeInstance(_nativeObject.photo3);
         }
      }
   }
}
