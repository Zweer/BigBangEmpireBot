package com.playata.application.ui.dialogs
{
   import com.playata.application.data.dataobject.DOOpticalChangeChest;
   import com.playata.application.ui.elements.generic.dialog.UiDialog;
   import com.playata.application.ui.elements.optical_changes.SpineOpticalChangeChestEffects;
   import com.playata.application.ui.elements.optical_changes.UiOpticalChangeChest;
   import com.playata.framework.application.Environment;
   import com.playata.framework.application.request.ActionRequestResponse;
   import com.playata.framework.core.Runtime;
   import com.playata.framework.core.util.JsonUtil;
   import com.playata.framework.input.InteractionEvent;
   import visuals.ui.dialogs.SymbolDialogOpenOpticalChangeChestsGeneric;
   
   public class DialogOpenOpticalChangeChests extends UiDialog
   {
      
      private static var CHEST_POSITION:Array = [[],[[0,0,1]],[[-280,0,1],[280,0,1]],[[-280,155,1],[280,155,1],[0,-155,1]],[[-280,155,1],[280,155,1],[-280,-155,1],[280,-155,1]],[[-180,-155,1],[180,-155,1],[-340,85,1],[330,85,1],[-5,215,1]],[[-25,-155,1],[315,-80,1],[315,150,1],[-25,235,1],[-365,150,1],[-365,-80,1]],[[-25,-155,1],[315,-80,1],[315,150,1],[-25,235,1],[-365,150,1],[-365,-80,1],[-25,-38,1]],[[0,-180,0.9],[320,-125,0.9],[350,75,0.9],[140,260,0.9],[-240,260,0.9],[-350,75,0.9],[-320,-125,0.9],[0,50,0.9]],[[0,-180,0.9],[320,-125,0.9],[350,60,0.9],[310,230,0.9],[0,265,0.9],[-319,230,0.9],[-350,60,0.9],[-320,-125,0.9],[0,50,0.9]],[[-330,-150,0.9],[0,-150,0.9],[300,-150,0.9],[-460,30,0.9],[-190,30,0.9],[80,30,0.9],[350,40,0.9],[-330,230,0.9],[0,230,0.9],[300,230,0.9]]];
       
      
      private var _chestObjects:Vector.<UiOpticalChangeChest>;
      
      private var _opticalChangeDialog:DialogOpticalChanges;
      
      private var _spine:SpineOpticalChangeChestEffects;
      
      public function DialogOpenOpticalChangeChests(param1:Array, param2:DialogOpticalChanges)
      {
         chests = param1;
         opticalChangeDialog = param2;
         _chestObjects = new Vector.<UiOpticalChangeChest>();
         var vo:SymbolDialogOpenOpticalChangeChestsGeneric = new SymbolDialogOpenOpticalChangeChestsGeneric();
         super(vo);
         _queued = false;
         _opticalChangeDialog = opticalChangeDialog;
         var positions:Array = CHEST_POSITION[chests.length > 10?10:chests.length];
         var i:int = 0;
         while(i < chests.length && i < positions.length)
         {
            var position:Array = positions[i];
            var chestObject:UiOpticalChangeChest = new UiOpticalChangeChest(chests[i],this);
            vo.addChild(chestObject);
            _chestObjects.push(chestObject);
            chestObject.x = 0;
            chestObject.y = 0;
            chestObject.scale = 0;
            _chestObjects[i].moveToPosition(position[0],position[1],position[2]);
            i = Number(i) + 1;
         }
         _spine = new SpineOpticalChangeChestEffects(1);
         vo.addChild(_spine);
         _spine.burst();
         Runtime.delayFunction(function():void
         {
            Environment.audio.playFX("hideout_chest_burst.mp3");
         },0.6);
         openChests();
         onClick.add(onClickLayer);
      }
      
      override public function dispose() : void
      {
         var _loc1_:int = 0;
         _loc1_ = 0;
         while(_loc1_ < _chestObjects.length)
         {
            _chestObjects[_loc1_].dispose();
            _loc1_++;
         }
         _chestObjects = null;
         _vo.removeChild(_spine);
         _spine.dispose();
         _spine = null;
         onClick.remove(onClickLayer);
         super.dispose();
      }
      
      private function onClickLayer(param1:InteractionEvent) : void
      {
         var _loc2_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < _chestObjects.length)
         {
            _chestObjects[_loc2_].skipAnimation();
            _loc2_++;
         }
         _spine.visible = false;
      }
      
      public function openChests() : void
      {
         var _loc2_:int = 0;
         var _loc1_:Array = [];
         _loc2_ = 0;
         while(_loc2_ < _chestObjects.length)
         {
            _loc1_.push(_chestObjects[_loc2_].chest.getData("id"));
            _loc2_++;
         }
         Environment.application.sendActionRequest("openOpticalChangeChests",{"opticalChangeChestIds":JsonUtil.encode(_loc1_)},handleRequests);
      }
      
      public function chestClosed(param1:UiOpticalChangeChest) : void
      {
         if(_chestObjects)
         {
            _opticalChangeDialog.refresh();
            close();
         }
      }
      
      private function handleRequests(param1:ActionRequestResponse) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc3_:* = null;
         var _loc7_:* = param1.action;
         if("openOpticalChangeChests" !== _loc7_)
         {
            throw new Error("Unsupported request action \'" + param1.action + "\'!");
         }
         if(param1.error == "")
         {
            Environment.application.updateData(param1.data);
            _loc4_ = 0;
            while(_loc4_ < _chestObjects.length)
            {
               _loc5_ = _chestObjects[_loc4_].chest.getInt("id");
               _loc3_ = null;
               _loc7_ = 0;
               var _loc6_:* = param1.appResponse.chests;
               for each(var _loc2_ in param1.appResponse.chests)
               {
                  if(_loc2_.id == _loc5_)
                  {
                     _loc3_ = _loc2_;
                     break;
                  }
               }
               if(_loc3_)
               {
                  _chestObjects[_loc4_].setOpticalChangeData(_loc3_);
               }
               _loc4_++;
            }
         }
         else
         {
            Environment.reportError(param1.error,param1.request);
         }
      }
   }
}
