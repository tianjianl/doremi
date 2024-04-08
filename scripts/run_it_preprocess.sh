source constants.sh
INTERMEDIATE_SCRATCH_PATH=${CACHE}/pile_preprocessed_tmp
TOKENIZER=google/mt5-large
SPLIT=valid
for PILE_DOMAIN in it zh sw; do 
for file in $(ls /scratch/tli104/mc4/c4/tilted_data/${PILE_DOMAIN} | grep 'validation' ); do
SUBSET=$(echo "$file" | cut -d '-' -f 4)
LOGDIR=logs/preprocess_mc4/${SPLIT}
mkdir -p ${LOGDIR}
jid=$(sbatch \
        --parsable \
        --partition ${PARTITION} \
        --mem 8G \
        -c 1 \
        --output ${LOGDIR}/${PILE_DOMAIN}_${SUBSET} \
        scripts/run.sh "python scripts/preprocess_pile.py --pile_path_dir ${PILE_DIR} --output_dir ${PREPROCESSED_PILE_DIR} --intermediate_dir ${INTERMEDIATE_SCRATCH_PATH} --cache_dir ${CACHE} --split ${SPLIT} --domain \"${PILE_DOMAIN}\" --tokenizer ${TOKENIZER} --seed 111 --nproc 1 --subset ${SUBSET}")
echo -n "${jid} "
done
done
