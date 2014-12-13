using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using UniRx;


public partial class GameLogicView 
{

    public GameObject playerPrefab;
    public GameObject factionPrefab;


    /// This binding will add or remove views based on an element/viewmodel collection.
    public override ViewBase CreatePlayersView(PlayerViewModel item) 
    {
        //ViewBase playerView = InstantiateView(playerPrefab, item, Vector3.zero, Quaternion.identity);
        //playerView.gameObject.name = "_" + item.Name;

        return null;
    }
    
    /// This binding will add or remove views based on an element/viewmodel collection.
    public override void PlayersAdded(ViewBase item) {
        base.PlayersAdded(item);
    }
    
    /// This binding will add or remove views based on an element/viewmodel collection.
    public override void PlayersRemoved(ViewBase item) {
        base.PlayersRemoved(item);
    }
    
    /// This binding will add or remove views based on an element/viewmodel collection.
    public override ViewBase CreateFactionsView(FactionViewModel item) 
    {
        ViewBase factionView = InstantiateView(factionPrefab, item, Vector3.zero, Quaternion.identity);
        factionView.gameObject.name = "_" + item.Name;

        return factionView;
    }
    
    /// This binding will add or remove views based on an element/viewmodel collection.
    public override void FactionsAdded(ViewBase item) {
        base.FactionsAdded(item);
    }
    
    /// This binding will add or remove views based on an element/viewmodel collection.
    public override void FactionsRemoved(ViewBase item) {
        base.FactionsRemoved(item);
    }
}
