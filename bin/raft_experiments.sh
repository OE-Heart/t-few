for dataset in ade_corpus_v2 terms_of_service tai_safety_research neurips_impact_statement_risks overruling systematic_review_inclusion one_stop_english tweet_eval_hate twitter_complaints semiconductor_org_types
do
    python -m src.pl_train -c t03b.json+ia3.json -k load_weight="pretrained_checkpoints/t03b_ia3_finish.pt" dataset=${dataset} exp_name=t03b_${dataset}_ia3 few_shot=False unlikely_loss=1 length_norm=1 mc_loss=1 batch_size=8 grad_accum_factor=8 compute_strategy="none"  raft_cross_validation=False
    python -m src.pl_train -c t03b.json+ia3.json -k load_weight="exp_out/t03b_${dataset}_ia3/finish.pt" dataset=${dataset} exp_name=t03b_${dataset}_ia3_eval few_shot=False length_norm=1 raft_cross_validation=False compute_strategy="none" eval_batch_size=16 num_steps=0 save_model=False
done


# python -m src.pl_train -c t03b.json+ia3.json -k load_weight="pretrained_checkpoints/t03b_ia3_finish.pt" dataset=banking_77 exp_name=t03b_banking_77_ia3 few_shot=False unlikely_loss=0 length_norm=1 mc_loss=0 max_seq_len=512 batch_size=1 grad_accum_factor=8 compute_strategy="none" raft_cross_validation=False
# python -m src.pl_train -c t03b.json+ia3.json -k load_weight="exp_out/t03b_banking_77_ia3/finish.pt" dataset=banking_77 exp_name=t03b_banking_77_ia3_eval few_shot=False length_norm=1 eval_batch_size=1 raft_cross_validation=True compute_strategy="none" num_steps=0 raft_labels_in_input_string=comma cleaned_answer_choices_b77=1 save_model=False max_seq_len=512