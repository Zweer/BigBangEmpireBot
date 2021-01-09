package com.playata.application.data.guild
{
   import com.playata.application.data.constants.CConstant;
   import com.playata.application.data.constants.CGuildArtifact;
   import com.playata.application.platform.ServerInfo;
   import com.playata.framework.localization.LocText;
   
   public class GuildArtifact
   {
       
      
      private var _id:int = 0;
      
      public function GuildArtifact(param1:int)
      {
         super();
         _id = param1;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get name() : String
      {
         return LocText.current.text("artifact/" + assetIdentifier + "/name");
      }
      
      public function get tooltip() : String
      {
         return LocText.current.text("artifact/tooltip",name,bonusInfo,attributeReduction);
      }
      
      public function get type() : int
      {
         return CGuildArtifact.fromId(id).type;
      }
      
      public function get attributeReduction() : int
      {
         return int(CGuildArtifact.fromId(id).attributeReduction * 100);
      }
      
      public function get bonusInfo() : String
      {
         switch(int(type) - 1)
         {
            case 0:
               return LocText.current.text("artifact/type/duel_stamina",value,CConstant.guild_artifact_duel_stamina_cost_step);
            case 1:
               return LocText.current.text("artifact/type/quest_energy",value);
            case 2:
               return LocText.current.text("artifact/type/movie_count",value);
         }
      }
      
      public function get value() : int
      {
         return CGuildArtifact.fromId(id).value;
      }
      
      public function get assetIdentifier() : String
      {
         return CGuildArtifact.fromId(id).assetIdentifier;
      }
      
      public function get imageUrl() : String
      {
         return ServerInfo.assetURL("artifacts/" + assetIdentifier,"png");
      }
   }
}
